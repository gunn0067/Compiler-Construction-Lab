%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
[0-9]+ {
    long num = strtol(yytext, NULL, 10);
    printf("Decimal: %s\tHexadecimal: %lX\n", yytext, num);
}
[ \t\n]+   { }
.          { printf("Invalid character: %s\n", yytext); }
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter decimal numbers:\n");
    yylex();
    return 0;
}