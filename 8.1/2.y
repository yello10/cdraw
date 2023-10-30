%{                                                                          
#include<stdio.h>                                                           
%}                                                                          
%token NUMBER                                                               
%left OR                                                                    
%left AND                                                                   
%left NOT                                                                   
%left '>''<' GE LE EQ NE                                                    
%%                                                                          
boolexp : E{                                                                
        printf("\noutput=");                                                
        if($$==0)                                                           
          printf("F\n\n");                                                  
        else                                                                
          printf("T\n\n");                                                  
    return 0;                                                               
}                                                                           
E: E AND E {$$ = $1 && $3;}                                                 
 | E OR E {$$ = $1 || $3;}                                                  
 | E NOT E {$$ = $1 =! $3;}                                                 
 | E '>' E {$$ = $1>$3;}                                                    
 | E GE E {$$ = $1 >= $3;}                                                  
 | E '<' E {$$ = $1<$3;}                                                    
 | E LE E {$$ = $1 <= $3;}                                                  
 | E EQ E {$$ = $1 == $3;}                                                  
 | E NE E {$$ = $1 != $3;}                                                  
 | NUMBER {$$ =  $1;}                                                       
;                                                                           
%%                                                                          
void main()
{
    yyin = fopen("i.txt", "r");
    if (yyin == NULL) {
        perror("Error opening file");
        return 1;
    }
}
						 
{                                                                           
printf ("enter expression:\n");                                             
yyparse();                                                                  
}                                                                           
void yyerror()                                                              
{                                                                           
printf("-T\n");                                                        
return 1;                                                                   
}                                                                           
