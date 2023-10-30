%option noyywrap
%{
#include <stdio.h>
int line_number = 1;
int brace_count = 0;
int parenthesis_count = 0;
%}

%%

"("    { parenthesis_count++; }
")"    { parenthesis_count--; }
"{"    { brace_count++; }
"}"    { brace_count--; }

\n     { line_number++; }

.      ;

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

    if (brace_count > 0) {
        printf("Unmatched '{' at line %d\n", line_number);
    } else if (brace_count < 0) {
        printf("Unmatched '}' at line %d\n", line_number);
    }

    if (parenthesis_count > 0) {
        printf("Unmatched '(' at line %d\n", line_number);
    } else if (parenthesis_count < 0) {
        printf("Unmatched ')' at line %d\n", line_number);
    }

    if (brace_count == 0 && parenthesis_count == 0) {
        printf("No syntax errors found.\n");
    }

    return 0;
}


