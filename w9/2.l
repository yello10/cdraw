%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h" 
%}

%%

[a-zA-Z][a-zA-Z0-9]*  {
                         
                          int length = yyleng;
                          char lexeme[length + 1];
                          strncpy(lexeme, yytext, length);
                          lexeme[length] = '\0';
                          yylval.str = strdup(lexeme); 
                          return IDENTIFIER;
                        }

int                     { return INTEGER; }
float                   { return FLOAT; }
char                    { return CHAR; }
void                    { return VOID; }
\+|\-                    { return ADDSUB; }
\*|\/                    { return MULDIV; }
\(|\)                   { return PAREN; }
;                       { return SEMICOLON; }
,                       { return COMMA; }

[ \t\n]                 ; 

.                       { return OTHER; } 

%%

int yywrap() {
    return 1;
}


