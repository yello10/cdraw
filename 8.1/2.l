%{                                                                          
#include<stdio.h>                                                           
#include"y.tab.h"                                                           
%}                                                                          
%%                                                                          
"OR" return OR;                                                             
"AND" return AND;                                                           
"NOT" return NOT;                                                           
">=" return GE;                                                             
"<=" return LE;                                                             
"==" return EQ;                                                             
"!=" return NE;                                                             
">" return '>';                                                             
"<" return '<';                                                             
[0-9]+ {yylval = atoi(yytext);                                              
          return NUMBER;}                                                   
[ \t]  ;                                                                    
\n   return 0;                                                              
%%                                                                          
int yywrap() {                                                              
   return 1;                                                                
}                                                                           
