%{
#include <stdio.h>
#include <string.h>
%}

%option noyywrap

%%
"do"            { printf("while (1) {\n"); }
"while"         { printf("if (!(1) {\n"); }
"{"             { printf("{\n"); }
"}"             { printf("}\n"); }
.|\n            { printf("%s", yytext); } // Print other characters as is
%%

int main() {
    FILE* inputFile = fopen("o2.txt", "r");
    if (!inputFile) {
        fprintf(stderr, "Failed to open input.txt\n");
        return 1;
    }

    yyin = inputFile;
    yylex();

    fclose(inputFile);
    return 0;
}


