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

int main() {
    yylex();

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

