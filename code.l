%{
#include <stdio.h>
#include <ctype.h>  // 用于 tolower 函数
%}

%%

[\t ]+		/* 忽略空白字符 */ ;

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
    // 将 yytext 转换为小写
    for (int i = 0; yytext[i]; i++) {
        yytext[i] = tolower(yytext[i]);
    }
    printf("%s: is a verb\n", yytext);  // 打印小写形式的动词
}

[a-zA-Z]+ 	{ printf("%s: is not a verb\n", yytext); }  // 非动词的单词

.|\n     	{ ECHO; /* 默认的动作，输出其它字符 */ }

%%

int main() {
    yylex();  // 运行词法分析器
    return 0;
}
