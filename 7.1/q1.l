%option noyywrap
%{
#include <stdio.h>
int error_count = 0;
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

int|char|float|double|void    { printf("Data type: %s\n", yytext); }
if|else|while|for            { printf("Control keyword: %s\n", yytext); }
[0-9]+                       { printf("Integer constant: %s\n", yytext); }
\"[^\"\n]*\"                 { printf("String constant: %s\n", yytext); }
\/\/.*                       { printf("Comment: %s\n", yytext); }
\/\*[^*]*\*+([^/*][^*]*\*+)*\/ { printf("Comment: %s\n", yytext); }
[(){};,]                    { printf("Special character: %s\n", yytext); }
[+-/*<>=]                     {printf("operator: %s\n",yytext);}
[_a-zA-Z][_a-zA-Z0-9]*      { printf("Identifier: %s\n", yytext);}
[ \t\n]                          {}
.                            { printf("Unknown token: %s\n", yytext); error_count++; }


%%

int main()
{
    yyin = fopen("ex.c", "r");
    if (yyin == NULL) {
        perror("Error opening file");
        return 1;
    }
    yylex();
    if (error_count == 0) {
        printf("\n");
    } else {
        printf("%d \n", error_count);
    }
    
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
    fclose(yyin);
    return 0;
}
