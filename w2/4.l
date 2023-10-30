%option noyywrap
%{
        #include<stdio.h>
        int ch=0,sp=0,tabs=0;
%}
%%
[ ]     {sp++;}
\t      {tabs++;}
[a-zA-Z] {ch++;}
%%
int main()
{
        yyin = fopen("sample.txt","r");
        yylex();
        printf("Chars:%d\nSpaces:%d\nTabs:%d\n",ch,sp,tabs);
        return 0;

}
