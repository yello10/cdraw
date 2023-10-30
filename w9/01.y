
%{
#include <stdio.h>
#include <string>
#include <stdlib.h>
%}
%token NUMBER
%token math
%token string
%token IDENTIFIER
%token ERROR

%%

statement: IDENTIFIER '\n'    { printf("Valid variable: %s\n", $1); }
         | ERROR '\n'         { printf("Invalid variable: %s\n", $1); }
         ;

IDENTIFIER:[a-z][a-zA-Z0-9]*
          ;

ERROR: .                 { $$ = yytext; }

%%

int main() {
    yyparse();
    return 0;
}

int yywrap() {
    return 1;
}

