%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
int yyerror(const char *s);
%}

%union {
    double val;
}

%token <val> NUMBER
%type <val> expr

%%
input:
      expr '\n' { printf("Result = %g\n", $1); }
    ;

expr:
      NUMBER        { $$ = $1; }
    | expr expr '+'  { $$ = $1 + $2; }
    | expr expr '-'  { $$ = $1 - $2; }
    | expr expr '*'  { $$ = $1 * $2; }
    | expr expr '/'  {
          if ($2 == 0) {
              yyerror("Division by zero");
              YYABORT;
          }
          $$ = $1 / $2;
      }
    ;
%%

int yyerror(const char *s)
{
    printf("Error: %s\n", s);
    return 0;
}

int main()
{
    printf("Enter a postfix expression:\n");
    yyparse();
    return 0;
}