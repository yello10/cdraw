%{
#include <stdio.h>
#include <stdlib.h>
%}
%token NUMBER
%%
input: /* empty */
| input line
;
line: '\n'
| expression '\n' { printf("Result: %d\n", $1); }
;
expression: term
| expression '+' term { $$ = $1 + $3; }
| expression '-' term { $$ = $1 - $3; }
;
term: factor
| term '*' factor { $$ = $1 * $3; }
| term '/' factor {
if ($3 == 0) {
fprintf(stderr, "Error: Division by zero\n");
exit(1);
}
$$ = $1 / $3;
}
;
factor: NUMBER
| '(' expression ')' { $$ = $2; }
;
%%
int main(void) {
yyparse();
return 0;
}
