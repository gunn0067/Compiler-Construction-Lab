```lex
%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
[0-9]+      { return NUMBER; }
[ \t]+      { }
\n          { return '\n'; }
.           { return yytext[0]; }
%%

int yywrap()
{
    return 1;
}
```

