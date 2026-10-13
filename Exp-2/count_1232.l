%{
#include <stdio.h>

int comments = 0, keywords = 0, identifiers = 0;
int words = 0, lines = 0, spaces = 0;
%}

%%
"//"[^\n]*   { comments++; }
"/*"([^*]|\*+[^*/])*\*+"/"  { comments++; }

"int"|"float"|"char"|"double"|"if"|"else"|"while"|"for"|"return"|"void"
             { keywords++; words++; }

[a-zA-Z_][a-zA-Z0-9_]*
             { identifiers++; words++; }

[ \t]+       { spaces += yyleng; }
\n           { lines++; }
.            { }
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter input (Ctrl+D to finish):\n");
    yylex();

    printf("\nComments: %d\n", comments);
    printf("Keywords: %d\n", keywords);
    printf("Identifiers: %d\n", identifiers);
    printf("Words: %d\n", words);
    printf("Lines: %d\n", lines);
    printf("Spaces: %d\n", spaces);

    return 0;
}