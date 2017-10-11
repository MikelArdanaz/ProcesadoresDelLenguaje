/********************************************************
 * Scanner.ypp
 ********************************************************/
%{
//-- Lexer prototype required by bison, aka getNextToken()
int yylex();
int yyerror(const char *p) { cerr << "Error!" << endl; }
%}

//-- SYMBOL SEMANTIC VALUES -----------------------------
/*
%union {
  int val;
  char sym;
};*/
%token LENT
%token LREA
%token LCAR
%token LCAD
%token COME
%token ACCI
%token ALGO
%token BOOL
%token CADE
%token CARA
%token CONS
%token CONT
%token DRDE
%token DDEV
%token DDIV
%token ENTR
%token ENTE
%token FACC
%token FALG
%token LBOO
%token FCON
%token FFUN
%token FMIE
%token FPAR
%token DFSI
%token FTIP
%token FTUP
%token FUNC
%token FVAR
%token HACE
%token HAST
%token MIEN
%token DMOD
%token DRNO
%token DROR
%token PARA
%token REAL
%token DREF
%token DSAL
%token DRSI
%token TABL
%token TIPO
%token TUPL
%token DVAR
%token DAND
%token ENTO
%token COMP
%token SUMA
%token REST
%token PROD
%token ENSA
%token SEPA
%token SUBR
%token DEFT
%token CREA
%token SINO
%token INAR
%token FINA
%token IDEN
%token ASIG
%token SECU

//-- GRAMMAR RULES ---------------------------------------
%%

%%
//-- FUNCTION DEFINITIONS ---------------------------------
int main()
{
  yyparse();
  return 0;
}
