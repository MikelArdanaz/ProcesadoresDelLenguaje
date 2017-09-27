CC       = gcc -g
LEX      = flex -i -I
YACC     = bison -d -y

scanner: scanner.l
	$(LEX)  scanner.l
	$(CC)   lex.yy.c -o scanner -ll
