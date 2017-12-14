#detectar OS X
OS:= $(shell uname)
ifeq ($(OS),Darwin)
	LFL = -ll
else
	LFL = -lfl
endif
CC       = gcc -o
LEX      = flex -i -I
YACC     = bison -d -v
all: compilador
parser: parser.y
	$(YACC) parser.y
scanner: scanner.l
	$(LEX) scanner.l
compilador: parser scanner
	rm -rf tabla_simbolos
	rm -rf tabla_cuadruplas
	$(CC) compilador parser.tab.c ts.c tc.c booleanos.c lex.yy.c $(LFL)
