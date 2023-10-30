%option noyywrap
%{
#include <stdio.h>
int in_comment = 0; // Track whether we are inside a comment block
%}

%%
"/*"    { in_comment = 1; }
"*/"    { if (in_comment) in_comment = 0; }
"//"    { if (!in_comment) ECHO; }
.       { if (!in_comment) ECHO; }
\n      { if (!in_comment) ECHO; }

%%

int main() {
    yylex();
    return 0;
}

