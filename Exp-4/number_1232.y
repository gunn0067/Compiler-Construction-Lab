%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
int yyerror(const char *s);
%}

%token NUMBER

%%
input:
      expr '\n'  { printf("Valid expression\n"); }
    ;

expr:
      NUMBER
    | expr '+' expr
    | expr '-' expr
    | expr '*' expr
    | expr '/' expr
    | '(' expr ')'
    ;
%%

int yyerror(const char *s)
{
    printf("Invalid expression\n");
    return 0;
}

int main()
{
    printf("Enter an arithmetic expression:\n");
    yyparse();
    return 0;
}