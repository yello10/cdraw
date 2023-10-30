%{
#include "y.tab.h"
%}
%%

[0-9]+      { yylex= atoi(yytext);
                    return NUMBER; 
             }
[-+*/(){}]  { return yytext[0]; }
[ \t\n]
; 
.           { fprintf(stderr, "Invalid character: %s\n", yytext); }
%%
int yywrap(void) {
return 1;
}
