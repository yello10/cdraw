%{
#include <stdio.h>
#include <string.h>
%}
                                                                                                                                                        
%option noyywrap
                                                                                                                                                        
%%
[A-Za-z]+    {
                int length = strlen(yytext);
                if (islower(yytext[0])) {
                    if (isupper(yytext[length - 1])) {
                        printf("Start of lowercase word: %s\n", yytext);
                    } else {
                        printf("Appending lowercase word: %s\n", yytext);
                    }                                                                                                                                   
                } else if (isupper(yytext[0])) {
                    if (isupper(yytext[length - 1])) {
                        printf("Start of Uppercase word: %s\n", yytext);
                    } else {
                        printf("Appending Uppercase word: %s\n", yytext);
                    }                                                                                                                                   
                }                                                                                                                                       
              }
                                                                                                                                                        
.            ;
                                                                                                                                                        
%%
                                                                                                                                                        
int main() {
    yylex();                                                                                                                                            
    return 0;
} 

