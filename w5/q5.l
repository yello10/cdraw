%option noyywrap                                                                                                                                       
%{                                                                                                                                                     
    #include <stdio.h>                                                                                                                                 
    #include <stdlib.h>                                                                                                                                
    #include <string.h>                                                                                                                                
    char stack[100];                                                                                                                                   
    int tos=0;                                                                                                                                         
    void push(char);                                                                                                                                   
    void pop();                                                                                                                                        
    char top();                                                                                                                                        
    char result[100];                                                                                                                                  
    int t=0;                                                                                                                                           
    int priority(char c);                                                                                                                              
%}                                                                                                                                                     
%%                                                                                                                                                     
.* {                                                                                                                                                   
    char *str=yytext;                                                                                                                                  
    int i,j,l=0,h=yyleng-1;                                                                                                                            
    char s[100];                                                                                                                                       
    while(h>=0)                                                                                                                                        
    {                                                                                                                                                  
        s[l]=str[h];                                                                                                                                   
        l++;                                                                                                                                           
        h--;                                                                                                                                           
    }                                                                                                                                                  
    for(i=0;i<yyleng;i++)                                                                                                                              
    {                                                                                                                                                  
        if(s[i]==')')                                                                                                                                  
        {                                                                                                                                              
            s[i]='(';                                                                                                                                  
        }                                                                                                                                              
        else if(s[i]=='(')                                                                                                                             
        {                                                                                                                                              
            s[i]=')';                                                                                                                                  
        }                                                                                                                                              
    }                                                                                                                                                  
    for(i=0;i<yyleng;i++)                                                                                                                              
    {                                                                                                                                                  
        if(s[i]=='+'||s[i]=='-'||s[i]=='*'||s[i]=='/'||s[i]=='('||s[i]==')'||s[i]=='^')                                                                
        {                                                                                                                                              
            char op=s[i];                                                                                                                              
            if(tos==0||op=='(')                                                                                                                        
            {                                                                                                                                          
                push(op);                                                                                                                              
            }                                                                                                                                          
            else if(op==')')                                                                                                                           
            {                                                                                                                                          
                while(top()!='(')                                                                                                                      
                {                                                                                                                                      
                    result[t]=top();                                                                                                                   
                    t++;                                                                                                                               
                    pop();                                                                                                                             
                }                                                                                                                                      
                pop();                                                                                                                                 
            }                                                                                                                                          
            else if(op=='^'&&top()=='^')                                                                                                               
            {                                                                                                                                          
                push(op);                                                                                                                              
            }                                                                                                                                          
            else if(priority(op)>priority(top()))                                                                                                      
            {                                                                                                                                          
                push(op);                                                                                                                              
            }                                                                                                                                          
            else if(priority(op)<=priority(top()))                                                                                                     
            {                                                                                                                                          
                while(priority(op)<priority(top()))                                                                                                    
                {                                                                                                                                      
                    result[t]=top();                                                                                                                   
                    t++;                                                                                                                               
                    pop();                                                                                                                             
                }                                                                                                                                      
                push(op);                                                                                                                              
            }                                                                                                                                          
        }                                                                                                                                              
        else if(s[i]==' ')                                                                                                                             
        {                                                                                                                                              
            continue;                                                                                                                                  
        }                                                                                                                                              
        else{                                                                                                                                          
            result[t]=s[i];                                                                                                                            
            t++;                                                                                                                                       
        }                                                                                                                                              
    }                                                                                                                                                  
}                                                                                                                                                      
\n  {                                                                                                                                                  
        int i;                                                                                                                                         
        for(i=tos-1;i>=0;i--)                                                                                                                          
        {                                                                                                                                              
            if(stack[i]!='('&&stack[i]!=')')                                                                                                           
            {                                                                                                                                          
                result[t]=stack[i];                                                                                                                    
                t++;                                                                                                                                   
            }                                                                                                                                          
        }                                                                                                                                              
        for(i=t-1;i>=0;i--)                                                                                                                            
        {                                                                                                                                              
            printf("%c", result[i]);                                                                                                                   
        }                                                                                                                                              
        tos=0;                                                                                                                                         
        t=0;                                                                                                                                           
        printf("\n");                                                                                                                                  
       }                                                                                                                                               
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
void pop()                                                                                                                                             
{                                                                                                                                                      
    tos--;                                                                                                                                             
}                                                                                                                                                      
char top()                                                                                                                                             
{                                                                                                                                                      
    return stack[tos-1];                                                                                                                               
}                                                                                                                                                      
void push(char c)                                                                                                                                      
{                                                                                                                                                      
    stack[tos]=c;                                                                                                                                      
    tos++;                                                                                                                                             
}                                                                                                                                                      
int priority(char c)                                                                                                                                   
{                                                                                                                                                      
    if(c=='+')                                                                                                                                         
    {                                                                                                                                                  
        return 1;                                                                                                                                      
    }                                                                                                                                                  
    else if(c=='-')                                                                                                                                    
    {                                                                                                                                                  
        return 1;                                                                                                                                      
    }                                                                                                                                                  
    else if(c==')')                                                                                                                                    
    {                                                                                                                                                  
        return 0;                                                                                                                                      
    }                                                                                                                                                  
    else if(c=='(')                                                                                                                                    
    {                                                                                                                                                  
        return 0;                                                                                                                                      
    }                                                                                                                                                  
    else if(c=='*')                                                                                                                                    
    {                                                                                                                                                  
        return 2;                                                                                                                                      
    }                                                                                                                                                  
    else if(c=='/')                                                                                                                                    
    {                                                                                                                                                  
        return 2;                                                                                                                                      
    }                                                                                                                                                  
    else if(c=='^')                                                                                                                                    
    {                                                                                                                                                  
        return 3;                                                                                                                                      
    }                                                                                                                                                  
}            
