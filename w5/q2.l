%option noyywrap
%{
     #include<stdio.h>
     #include<string.h>
     char replace_with [] = "hi";
     char replace [] ="hello";
%}

%%
[a-zA-Z]+    { if(strcmp(yytext, replace)==0)
                   fprintf(yyout, "%s", replace_with);
                else
                    fprintf(yyout, "%s", yytext);}
.            fprintf(yyout, "%s", yytext);
%%

int main()
{
     extern FILE *yyin, *yyout;
     yyin=fopen("in.txt", "r");
     yyout=fopen("out.txt", "w");
     yylex();
     return 0; 
}


