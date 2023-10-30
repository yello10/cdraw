%option noyywrap
%{
#include<stdio.h>
%}
%%
([a]*|[a]*[b]+) printf("%s",yytext);
.+    printf("invalid");
%%

int main()
{
	printf("enter the string:");
	yylex();
	return 0;
}
