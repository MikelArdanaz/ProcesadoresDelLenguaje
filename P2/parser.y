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
%token   APER
%token   CIER
%token   DIVI

//-- GRAMMAR RULES ---------------------------------------
%%
desc_algoritmo : ALGO IDEN SECU cabecera_alg bloque_alg FALG PUNT {}
               ;

cabecera_alg   : decl_globales decl_a_f decl_ent_sal COME {}
               ;

bloque_alg     : bloque COME {}
               ;

decl_globales  : declaracion_tipo decl_globales {}
               | declaracion_const decl_globales {}
               | /*epsilon*/ {}
               ;

decl_a_f: accion_d decl_a_f   {}
         | funcion_f decl_a_f  {}
         | /*epsilon*/   {}
         ;

bloque:  declaraciones {}
      | instrucciones {}
      ;

declaraciones  : declaracion_tipo declaraciones {}
               | declaracion_const declaraciones   {}
               | declaracion_var declaraciones  {}
               | /*epsilon*/  {}
               ;

declaracion_tipo  : TIPO lista_d_tipo FTIP SECU {}
                  ;

declaracion_const : CONS lista_d_cte FCON SECU  {}
                  ;

declaracion_var   : DVAR lista_d_var FVAR SECU  {}
                  ;

lista_d_tipo      : IDEN CREA d_tipo SECU lista_d_tipo   {}
                  | /*epsilon*/  {}
                  ;

d_tipo            : TUPL lista_campos FTUP   {}
                  | TABL INAR expresion_t SUBR expresion_t FINA DRDE d_tipo   {}
                  ;

d_tipo            : IDEN   {}
                  | expresion_t SUBR expresion_t   {}
                  | DREF d_tipo  {}
                  | BASE   {}
                  ;

expresion_t       : expresion {}
                  | LCAR   {}
                  ;

lista_campos      : IDEN DEFT d_tipo SECU lista_campos   {}
                  | /*epsilon*/  {}
                  ;

lista_d_cte       : IDEN CREA LENT SECU lista_d_cte   {} /*TODO Agrupar literales en 1 token*/
                  | IDEN CREA LREA SECU lista_d_cte {}
                  | IDEN CREA LCAR SECU lista_d_cte {}
                  | IDEN CREA LCAD SECU lista_d_cte {}
                  | IDEN CREA LBOO SECU lista_d_cte {}
                  | /*epsilon*/   {}
                  ;

lista_d_var       : lista_id DEFT IDEN SECU lista_d_var  {}
                  | lista_id DEFT d_tipo SECU lista_d_var {}
                  | /*epsilon*/   {}
                  ;

lista_id          : IDEN SEPA lista_id  {}
                  | IDEN   {}
                  ;

decl_ent_sal      : decl_ent  {}
                  | decl_ent decl_sal   {}
                  | decl_sal   {}
                  ;

decl_ent          : ENTR lista_d_var
                  ;

decl_sal          : DSAL lista_d_var
                  ;

expresion         : exp_a  {}
                  | exp_b   {}
                  | funcion_ll {}
                  ;

exp_a             : exp_a SUMA exp_a   {}
                  | exp_a REST exp_a   {}
                  | exp_a PROD exp_a   {}
                  | exp_a DIVI exp_a   {}
                  | exp_a DMOD exp_a   {}
                  ;

exp_a             : exp_a DDIV exp_a   {}
                  | APER exp_a CIER  {}
                  | operando   {}
                  | literal_entero   {}
                  | literal_real  {}
                  | REST exp_a {}
                  ;

exp_b             : exp_b DAND exp_b {}
                  | exp_b DROR exp_b {}
                  | DRNO exp_b {}
                  | operando {}
                  | LBOO   {}
                  ;

exp_b             : expresion COMP expresion {}
                  | expresion CREA expresion {}
                  | APER exp_b CIER  {}
                  ;

operando          : IDEN   {}
                  | operando PUNT operando   {}
                  | operando INAR expresion FINA {}
                  | operando DREF   {}
                  ;

instrucciones     : instruccion SECU instrucciones {}
                  | instruccion  {}
                  ;

instruccion       : CONT   {}
                  | asignacion   {}
                  | alternativa  {}
                  | iteracion {}
                  | accion_ll {}
                  ;

asignacion        : operando ASIG expresion  {}
                  ;

alternativa       : DRSI expresion ENTO instrucciones lista_opciones DFSI  {}
                  ;

lista_opciones    : INAR FINA expresion ENTO instrucciones lista_opciones   {}
                  | /*epsilon*/  {}
                  ;

iteracion         : it_cota_fija {}
                  | it_cota_exp  {}
                  ;

it_cota_exp       : MIEN expresion HACE instrucciones FMIE  {}
                  ;

it_cota_fija      : PARA IDEN ASIG expresion HAST expresion HACE instrucciones FPAR {}
                  ;

accion_d          : ACCI a_cabecera bloque FACC {}
                  ;

funcion_d         : FUNC f_cabecera bloque DDEV expresion FFUN {}
                  ;

a_cabecera        : IDEN APER d_par_form CIER SECU  {}
                  ;

f_cabecera        : IDEN APER lista_d_var CIER DDEV d_tipo SECU   {}
                  ;

d_par_form        : d_p_form SECU d_par_form {}
                  | /*epsilon*/
                  ;

d_p_form          : ENTR lista_id DEFT d_tipo   {}
                  | DSAL lista_id DEFT d_tipo   {}
                  | ENSA lista_id DEFT d_tipo   {}
                  ;

accion_ll         : IDEN APER l_ll CIER   {}
                  ;

funcion_ll        : IDEN APER l_ll CIER   {}
                  ;

l_ll              : expresion SEPA l_ll   {}
                  | expresion {}
                  ;
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
