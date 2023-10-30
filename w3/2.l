%option noyywrap
%{
        #include<stdio.h>

%}
%%
("+"[0-9]*|"-"[0-9]*|[0-9]*) printf("%s",yytext) ;
.+    printf("invalid number");
%%

int main()
{
        printf("enter the number:");
        yylex();
        	
        return 0;
}
