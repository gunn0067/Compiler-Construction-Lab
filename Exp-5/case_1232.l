%{
#include <stdio.h>
#include <ctype.h>
%}

%%
[a-z]    { printf("%c", toupper(yytext[0])); }
[A-Z]    { printf("%c", tolower(yytext[0])); }
.        { printf("%s", yytext); }
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter a string:\n");
    yylex();
    return 0;
}