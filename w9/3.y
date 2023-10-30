%{
#include <stdio.h>
#include <math.h>
%}

%union {
    double num;
}

%token NUMBER
%token expression
%left '+' '-'
%left '*' '/'
%left UMINUS

%%

calculation: expression    { printf("Result: %lf\n", $1); }
           ;

expression: NUMBER         { $$ = $1; }
          | expression '+' expression  { $$ = $1 + $3; }
          | expression '-' expression  { $$ = $1 - $3; }
          | expression '*' expression  { $$ = $1 * $3; }
          | expression '/' expression  { 
                if ($3 != 0) 
                    $$ = $1 / $3; 
                else {
                    printf("Error: Division by zero\n");
                    yyerror("Division by zero");
                    YYABORT;
                }
            }
          | '(' expression ')' { $$ = $2; }
          | '-' expression %prec UMINUS { $$ = - $2; }
          ; 

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(const char* msg) {
    fprintf(stderr, "Error: %s\n", msg);
}


