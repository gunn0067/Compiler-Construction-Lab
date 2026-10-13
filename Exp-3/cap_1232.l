%{
#include <stdio.h>

int count = 0;
%}

%%
[Aa][a-zA-Z0-9_]*
             { count++; }
[a-zA-Z0-9_]+ { }
[ \t\n]+      { }
.             { }
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter a sentence:\n");
    yylex();

    printf("Words starting with A: %d\n", count);
    return 0;
}