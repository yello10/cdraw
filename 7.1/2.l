%option noyywrap
%{
#include <stdio.h>
int open_parentheses = 0;
int close_parentheses = 0;
%}

%%
\( {open_parentheses++;}
\) {close_parentheses++;}
.  {}
[ \t\n] {}


%%


int main()
{
   yyin = fopen("ex.c","r");
    if (yyin == NULL) {
        printf("Error opening file");
        return 1;
    }

  /*  int c;
    while ((c = fgetc(yyin)) != EOF) {
        if (c == '(') {
            open_parentheses++;
        } else if (c == ')') {
            close_parentheses++;
        }
    }*/
yylex();

    fclose(yyin);

    if (open_parentheses == close_parentheses) {
        printf("Parentheses are balanced.\n");
    } else {
        printf("Parentheses are not balanced.\n");
    }

    return 0;
}

