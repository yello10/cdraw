%option noyywrap
%{
        #include<stdio.h>

%}
%%
([a-z]*"a"[a-z]*"e"[a-z]*"i"[a-z]*"o"[a-z]*"u") {printf("valid-"); 
printf("%s",yytext);}
.+    printf("invalid");
%%

int main()
{
        printf("enter the string:");
        yylex();
        return 0;
}
