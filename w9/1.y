%{
#include <stdio.h>
#include <ctype.h>
%}
%token IDENTIFIER
%token END_OF_INPUT
%%
program: statement_list END_OF_INPUT;
statement_list: statement
	      | statement_list statement;
statement: IDENTIFIER '\n';
%%

int yylex() {
int c = getchar();
if (isalpha(c)) {
	yylval = c;
	while ((c = getchar()) && (isalnum(c) || c == '_'));
	ungetc(c, stdin);
	return IDENTIFIER;
	}	
if (c == '\n' || c == EOF) {return END_OF_INPUT;
}
return c;
}
int yyerror(const char* s) {
printf("Error: %s\n", s);
return 0;
}
int main() {
yyparse();
return 0;
}
