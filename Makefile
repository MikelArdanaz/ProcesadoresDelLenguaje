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
	gcc -o compilador parser.tab.c lex.yy.c $(LFL) 
