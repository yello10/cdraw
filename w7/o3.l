%option noyywrap                                                        
%{                                                                         
#include <stdio.h>                                                         
%}                                                                         
%%                                                                         
"//".*      /* Match single-line comments and ignore them */               
"/*".*"*/"$ /* Match multi-line comments and ignore them */                
.       {printf("%s",yytext);}    /* Match any other character */          
%%                                                                         
                                                                           
int main() {                                                               
FILE *fp=fopen("3.c","r");                                               
if(fp)                                                                     
        yyin=fp;                                                           
yylex();                                                                   
    return 0;                                                              
}  
