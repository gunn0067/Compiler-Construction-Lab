```lex
%{
#include <stdio.h>
%}

%%

"for"       { printf("Keyword: FOR\n"); }
"("         { printf("Left Parenthesis\n"); }
")"         { printf("Right Parenthesis\n"); }
";"         { printf("Semicolon\n"); }
"="         { printf("Assignment Operator\n"); }
"++"        { printf("Increment Operator\n"); }
"--"        { printf("Decrement Operator\n"); }
"<="|">="|"=="|"!="|"<"|">" {
                printf("Relational Operator: %s\n", yytext);
            }

[a-zA-Z_][a-zA-Z0-9_]* {
                printf("Identifier: %s\n", yytext);
            }

[0-9]+      {
                printf("Number: %s\n", yytext);
            }

[ \t\n]+    { /* Ignore whitespace */ }

.           { printf("Unknown character: %s\n", yytext); }

%%

int main()
{
    printf("Enter FOR loop:\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}
```