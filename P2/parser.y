/********************************************************
 * Parser.y
 ********************************************************/
%{
//-- Lexer prototype required by bison, aka getNextToken()
int yylex();
int yyerror(const char *p) { cerr << "Error!" << endl; }
extern FILE* yyin;
%}

//-- SYMBOL SEMANTIC VALUES -----------------------------
/*
%union {
  int val;
  char sym;
};*/
%token   LENT
%token   LREA
%token   LCAR
%token   LCAD
%token   COME
%token   ACCI
%token   ALGO
%token   BASE
%token   CONS
%token   CONT
%token   DRDE
%token   DDEV
%token   DDIV
%token   ENTR
%token   FACC
%token   FALG
%token   LBOO
%token   FCON
%token   FFUN
%token   FMIE
%token   FPAR
%token   DFSI
%token   FTIP
%token   FTUP
%token   FUNC
%token   FVAR
%token   HACE
%token   HAST
%token   MIEN
%token   DMOD
%token   DRNO
%token   DROR
%token   PARA
%token   REAL
%token   DREF
%token   DSAL
%token   DRSI
%token   TABL
%token   TIPO
%token   TUPL
%token   DVAR
%token   DAND
%token   ENTO
%token   COMP
%token   SUMA
%token   REST
%token   PROD
%token   ENSA
%token   SEPA
%token   SUBR
%token   DEFT
%token   CREA
%token   SINO
%token   INAR
%token   FINA
%token   IDEN
%token   ASIG
%token   SECU
%token   PUNT

//-- GRAMMAR RULES ---------------------------------------
%%
desc_algoritmo: ALGO IDEN SECU cabecera_alg bloque_alg FALG PUNT
cabecera_alg: decl_globales decl_a_f decl_ent_sal COME
bloque_alg: bloque COME
decl_globales: declaracion_tipo decl_globales|declaracion_const decl_globales|/*epsilon*/
decl_a_f: accion_d decl_a_f|funcion_f decl_a_f|/*epsilon*/
bloque: declaraciones|instrucciones
declaraciones: declaracion_tipo declaraciones | declaracion_const declaraciones| declaracion_var declaraciones| /*epsilon*/
declaracion_tipo: TIPO lista_d_tipo FTIP SECU
declaracion_const: CONS lista_d_cte FCON SECU
declaracion_var: DVAR lista_d_var FVAR SECU
lista_d_tipo: IDEN CREA d_tipo SECU lista_d_tipo| /*epsilon*/
d_tipo: TUPL lista_campos FTUP| TABL INAR expresion_t SUBR expresion_t FINA DRDE d_tipo
d_tipo: IDEN| expresion_t SUBR expresion_t| DREF d_tipo | BASE
expresion_t: expresion| LCAR
lista_campos: IDEN DEFT d_tipo SECU lista_campos| /*epsilon*/

%%
//-- FUNCTION DEFINITIONS ---------------------------------
int main( int argc, char **argv ){
   ++argv, --argc;  /* skip over program name */
   if ( argc > 0 )
      yyin = fopen( argv[0], "r" );
   else
      yyin = stdin;
   yyparse();
}
