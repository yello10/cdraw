%option noyywrap
%{
#include<stdio.h>
%}

%%

"+" printf("||");
"*" printf("&&");
. printf("%s",yytext);
"\n" {}

%%

int main()
{
        yylex();
        return 0;
}

