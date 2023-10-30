%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h" // Include YACC-generated header file
%}

%%

[0-9]+(\.[0-9]+)?  {
                      yylval.num = atof(yytext);
                      return NUMBER;
                  }

[\+\-\*\/\(\)]  { return yytext[0]; }

[ \t\n]         ; // Skip whitespace and newlines

.               { printf("Invalid character: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}
