%{                                                                                                                                                      
#include <stdio.h>                                                                                                                              
#include <stdlib.h>                                                                                                                             
#include <string.h>                                                                                                                             
#define SIZE 50                                                                                                                                 
	char stack[SIZE];                                                                                                                                       
	int top = -1;                                                                                                                                           

	void push(char c)                                                                                                                                       
	{                                                                                                                                                       
		if (top < SIZE - 1) {                                                                                                                               
			stack[++top]=c;                                                                                                                               
		}                                                                                                                                                   
	}                                                                                                                                                       

	char pop() {                                                                                                                                            
		if (top >= 0) {                                                                                                                                     
			return stack[top--];                                                                                                                            
		}                                                                                                                                                   
	}                                                                                                                                                       
	int get_precedence(char c) {                                                                                                                            
		if (c == '+' || c == '-') return 1;                                                                                                                 
		if (c == '*' || c == '/') return 2;                                                                                                                 
		return 0;                                                                                                                                           
	}                                                                                                                                                       
%}                                                                                                                                                      
%option noyywrap
%%
[a-zA-Z0-9]+    { printf("%s", yytext); }                                                                                                               
"("             { push('('); }                                                                                                                          
")"             { while (top >= 0 && stack[top] != '(')                                                                                                 
		printf("%c", pop());                                                                                                           
		pop();                                                                                                                         
	}                                                                                                                                      
[-+*/]          {                                                                                                                                       
	while (top >= 0 && get_precedence(stack[top]) >= get_precedence(yytext[0]) && stack[top] != '(')                                    
	{                                                                                                                                    
		printf("%c", pop());                                                                                                            
	}                                                                                                                                   
	push(yytext[0]);                                                                                                                    
}                                                                                                                                       
\n              { while (top >= 0) printf("%c", pop()); putchar('\n'); }                                                                                

%%                                                                                                                                                      
int main() {                                                                                                                                            
	yylex();                                                                                                                                            
	return 0;                                                                                                                                           
} 
