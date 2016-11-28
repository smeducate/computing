/**
 *  Lispy - A basic interpreter for a tiny Lisp like  language.
 *
 */

#include<stdio.h>
#include<stdlib.h>

#include<editline/readline.h>
#include<editline/history.h>

#include "mpc.h"


/**
 * Use the operator string to see and evaluate the numeric expression.
 */
long eval_op(long first, char* op, long second ) {
   if(strcmp(op, "+") == 0 ) { return first + second; }
   if(strcmp(op, "-") == 0 ) { return first - second; }
   if(strcmp(op, "*") == 0 ) { return first * second; }
   if(strcmp(op, "/") == 0 ) { return first / second; }
   return 0;
}

/**
 * Evaluates the contents of an AST.
 *
 * if the tag of an expression is a number, then we have a leaf and it always
 * evaluates to a number.
 *
 * if the tag of an expression is a EXPR then it starts with a  "(", followed by
 *  an operator and maybe another expression or number. An expression ends with a )
 *
 */
long eval(mpc_ast_t* t) {

   /** If tagged as a number then return the number. */
   if(strstr(t->tag,"number" )) {
       return(atoi(t->contents));
   }

   /** the operator is always the second child. */
   char* operator = t->children[1]->contents;

   /** Store the third child and evaluate. */
   long  x  = eval(t->children[2]);

   int i = 3; //Start iterating from the third children.
   while(strstr(t->children[i]->tag, "expr")) {
      x = eval_op(x, operator, eval(t->children[i]));
      i++;
   }

   return x;
}


int main(int argc, char** argv) {

    /** Create some parsers.*/
    mpc_parser_t* Number  = mpc_new("number");
    mpc_parser_t* Operator  = mpc_new("operator");
    mpc_parser_t* Expr  = mpc_new("expr");
    mpc_parser_t* Lispy  = mpc_new("lispy");

    /** Define these parsers for the following language. */
    mpca_lang(MPCA_LANG_DEFAULT,
      "                                                           \
        number   : /-?[0-9]+/ ;                                   \
        operator : '+' | '-' | '*' | '/' ;                        \
        expr     :  <number> | '(' <operator> <expr>+ ')' ;       \
        lispy    :  /^/ <operator> <expr>+ /$/ ;                  \
      ",
      Number, Operator, Expr, Lispy);

    /** Output the prompt for Lispy interpreter.*/
    puts("Lispy version 0.0.1");
    puts("Press Ctrl-C to exit the shell.");

    /** Loop indefinitely to capture and  print out user input.*/
    while(1) {
        /** Output the prompt and get user input. */
        char* input  = readline("lispy> ");

        /** add input to history for future reference. */
        add_history(input);

        /** Parse user input for lispy. */
        mpc_result_t r;
        if(mpc_parse("<stdin>",input,Lispy, &r)) {
            mpc_ast_print(r.output);
            long result = eval(r.output);
            printf("%li\n",result);
        } else {
            /** Otherwise print and delete the error. */
            mpc_err_print(r.error);
            mpc_err_delete(r.error);
        }

        /** free memory for input. */
        free(input);
    }
    /** Cleanup and delete the parsers. */
    mpc_cleanup(4,Number,Operator,Expr,Lispy);

    return 0;
}
