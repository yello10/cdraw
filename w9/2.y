
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "2.h"

SymbolTable symbol_table; 

int yylex(); 
%}

%union {
    char *str; 
}

%token NUMBER
%token IDENTIFIER INTEGER FLOAT CHAR VOID ADDSUB MULDIV PAREN SEMICOLON COMMA OTHER
%type <str> identifier

%%

declaration_list: 
                | declaration_list declaration
                ;

declaration: type identifier_list SEMICOLON
           ;

type: INTEGER
    | FLOAT
    | CHAR
    | VOID
    ;

identifier_list: identifier
               | identifier_list COMMA identifier
               ;

identifier: IDENTIFIER {
    if (!symbol_table_add(&symbol_table, $1)) {
        fprintf(stderr, "Error: Identifier '%s' redeclaration.\n", $1);
        exit(1);
    }
    free($1); 
}
          ;

%%

int main() {
    yyparse();
    
    symbol_table_display(&symbol_table);
    symbol_table_destroy(&symbol_table);
    return 0;
}

