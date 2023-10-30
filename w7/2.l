%option noyywrap
%{
#include <stdio.h>

int open_parentheses = 0;
int line_number = 1;
%}

%%
[\n]    { line_number++; }
[(]     { open_parentheses++; }
[)]     {open_parentheses--;
          if (open_parentheses < 0) {
            printf("Unmatched ')' at line %d\n", line_number);
            exit(1);  // Terminate the program with an error status
          }
        }
. ;

%%

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE *input_file = fopen(argv[1], "r");

    if (!input_file) {
        perror("Error opening file");
        return 1;
    }

    yyin = input_file;
    yylex();

    fclose(input_file);

    if (open_parentheses > 0) {
        printf("Unmatched '(' at line %d\n", line_number);
    } else if (open_parentheses < 0) {
        printf("Unmatched ')' at line %d\n", line_number);
    } else {
        printf("Parentheses are balanced.\n");
    }

    return 0;
}

