%option noyywrap                                                                                                                                       
%{                                                                                                                                                     
    #include<stdio.h>                                                                                                                                  
 int i=0;                                                                                                                                              
%}                                                                                                                                                     
%%                                                                                                                                                     
[a-z]+ {                                                                                                                                               
    printf("yytext:%s\nStart:%d\nEnd:%d\n",yytext,i,yyleng-1);i=yyleng;                                                                                
yymore();                                                                                                                                              
}                                                                                                                                                      
[A-Z]+ {                                                                                                                                               
printf("yytext:%s\nStart:%d\nEnd:%d\n",yytext,i,yyleng-1);i=yyleng;                                                                                    
yymore();                                                                                                                                              

}                                                                                                                                                      
[ \n] i=0;                                                                                                                                             
%%                                                                                                                                                     
int main(int argc, char* argv[])                                                                                                                       
{                                                                                                                                                      
    if(argc > 1)                                                                                                                                       
    {                                                                                                                                                  
        FILE *fp = fopen(argv[1], "r");                                                                                                                
        if(fp)                                                                                                                                         
        {                                                                                                                                              
            yyin = fp;                                                                                                                                 
            yylex();                                                                                                                                   
        }                                                                                                                                              
    }                                                                                                                                                  
    return 1;                                                                                                                                          
}                                                                                                                                                      
             
