/**
 *  Lispy - A basic interpreter for a tiny Lisp like  language.
 *
 */

#include<stdio.h>
#include<stdlib.h>

#include<editline/readline.h>
#include<editline/history.h>

#include "mpc.h"



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
            /** On success print and delete the AST. */
            mpc_ast_t*  a = r.output;
            printf("Tag: %s\n", a->tag);
            printf("Contents: %s\n", a->contents);
            printf("Number of children: %i\n", a->children_num);
            mpc_ast_print(r.output);
            mpc_ast_delete(r.output);
        } else {
            /** Otherwise print and delete the error. */
            mpc_err_print(r.error);
            mpc_err_delete(r.error);
        }

        /** Echo input back to the user.*/
        printf("No you are a %s\n", input);

        /** free memory for input. */
        free(input);
    }
    /** Cleanup and delete the parsers. */
    mpc_cleanup(4,Number,Operator,Expr,Lispy);

    return 0;
}
