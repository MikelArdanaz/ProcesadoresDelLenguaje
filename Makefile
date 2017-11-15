#detectar OS X
OS:= $(shell uname)
ifeq ($(OS),Darwin)
	LFL = -ll
else
	LFL = -lfl
endif
CC       = gcc -c
LEX      = flex -i -I
YACC     = bison -d -y
all: compilador
parser: parser.y
	bison -d -v parser.y
scanner: scanner.l
	$(LEX) scanner.l
compilador: parser scanner
	$(CC) lex.yy.c
	$(CC) -o compilador parser.tab.c lex.yy.o $(LFL) -lm
