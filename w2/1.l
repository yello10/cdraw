
%option noyywrap
%{
int line_no = 0;
int char_no = 0;
%}
%%
\n ++line_no;
.  ++char_no;
end return 0;
%%
int main()
{
yylex();
printf("number of chars in the input string = %d\n",char_no );
return 0;
}

