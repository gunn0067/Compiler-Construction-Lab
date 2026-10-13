%{
#include <stdio.h>
%}

%%
[^\n]*COM\n {
    printf("Line ends with COM: %s", yytext);
}
[^\n]*\n {
    printf("Line does not end with COM: %s", yytext);
}
[^\n]+ {
    if (yyleng >= 3 &&
        yytext[yyleng-3] == 'C' &&
        yytext[yyleng-2] == 'O' &&
        yytext[yyleng-1] == 'M')
        printf("Line ends with COM: %s\n", yytext);
    else
        printf("Line does not end with COM: %s\n", yytext);
}
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter lines of text:\n");
    yylex();
    return 0;
}