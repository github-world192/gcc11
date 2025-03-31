%{
#include <stdio.h>
#include <ctype.h>  // For tolower function
%}

%%

[\t ]+		/* ignore white space */ ;

is |
am |
are |
were |
was |
be |
being |
been |
do |
does |
did |
will |
would |
should |
can |
could |
has |
have |
had |
go {
    // Convert the verb to lowercase
    for (int i = 0; yytext[i]; i++) {
        yytext[i] = tolower(yytext[i]);
    }
    printf("%s: is a verb\n", yytext);
}

[a-zA-Z]+ 	{ printf("%s: is not a verb\n", yytext); }

.|\n     	{ ECHO; /* default action for other characters */ }

%%

int main() {
    yylex();  // Run the lexer
    return 0;
}
