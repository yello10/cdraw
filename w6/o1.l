%{
#include <stdio.h>
#include <string.h>
int n=1;
%}
%option noyywrap
%%
"if"              { printf("switch (1) {\n");
                    printf("case: %d",n);n++; }
"else if"         { printf("case: %d",n);n++; }
"else"            { printf("default:\n"); }
"{"               { printf("{\n"); }
"}"               { printf("}\n"); }
.|\n              { printf("%s", yytext); } // Print other characters as is
%%
int main() {

		FILE* inputFile = fopen("o1.txt", "r");

		if (!inputFile) {

			fprintf(stderr, "Failed to open input.txt\n");

			return 1;

		}



		yyin = inputFile;

		yylex();


		fclose(inputFile);

		return 0;

	}


