%option noyywrap
%{
        #include<stdio.h>
        int curr_len=0,flag=0;
%}
%%
[\+][9][1][6-9][0-9]+ {curr_len = yyleng;if(yyleng == 13) flag=1; else flag=0;}
.     return 0;
%%

int main()
{
        yylex();
        if(flag == 0)
                printf("Invalid number!\n");
        else
                printf("Valid Number\n");
        return 0;
}
