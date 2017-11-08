#detectar OS X
OS:= $(shell uname)
ifeq ($(OS),Darwin)
	LFL = -ll
else
	LFL = -lfl
endif

CC       = gcc -g
LEX      = flex -i -ll -I
YACC     = bison -d -y
all: parser scanner
parser: parser.y
	bison -v -d parser.y
scanner: scanner.l
	$(LEX)  scanner.l
	$(CC)   lex.yy.c
	$(CC)   parser.tab.c lex.yy.o $(LFL) -lm -o scanner
