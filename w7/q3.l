%option noyywrap
%{
#include <stdio.h>
int in_comment = 0; // Track whether we are inside a comment block
%}

%%
"/*"    { in_comment = 1; }
"*/"    { if (in_comment) in_comment = 0; }
"//" { if (in_comment) in_comment= 0; }
.       { if (!in_comment) ECHO; }
\n      { if (!in_comment) ECHO; }

%%

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE *input_file = fopen(argv[1], "r");

    if (!input_file) {
        perror("Error opening file");
        return 1;
    }

    yyin = input_file;
    yylex();

    fclose(input_file);
    return 0;
}  
