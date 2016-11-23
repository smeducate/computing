/**
 *  Lispy - A basic interpreter for a tiny Lisp like  language.
 *
 */

#include<stdio.h>
#include<stdlib.h>

#include<editline/readline.h>
#include<editline/history.h>



int main(int argc, char** argv) {
    /** Output the prompt for Lispy interpreter.*/
    puts("Lispy version 0.0.1");
    puts("Press Ctrl-C to exit the shell.");

    /** Loop indefinately to capture and  print out user input.*/
    while(1) {
        /** Output the prompt and get user input. */
        char* input  = readline("lispy> ");

        /** add input to history for future reference. */
        add_history(input);

        /** Echo input back to the user.*/
        printf("No you are a %s\n", input);

        /** free memory for input. */
        free(input);
    }

    return 0;
}
