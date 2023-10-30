%{

    #include<stdio.h>

    int valid=1;

%}

%token digit letter

%%

start : letter s

s :     letter s

      | digit s

      |

      ;

%%

int yyerror()

{

    printf("\nIts not a identifier!\n");

    valid=0;

    return 0;

}

int main()

{

    printf("\nEnter variable that starts with a letter follows up by any no. of letters or digits: ");

    yyparse();

    if(valid)

    {

        printf("\nIt is a identifier!\n");

    }

}


