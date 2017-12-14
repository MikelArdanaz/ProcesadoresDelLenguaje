/********************************************************
 * Parser.y
 ********************************************************/
%{
//-- Lexer prototype required by bison, aka getNextToken()
#include <stdio.h>
#include "ts.h"
#include "tc.h"
int yylex();
void yyerror(const char* s);
extern FILE* yyin;
tablaSim MitablaSim;
tablaCuad MitablaCuad;
%}

//-- SYMBOL SEMANTIC VALUES -----------------------------
%union {
   long int entero;
   double real;
   char caracter;
   char *cadena;
   char *tipoiden;
   int booleano;
   int tipo;
   op_aritmetico op_a;
   expresion exp;
};
%left    DDIV DMOD DROR DAND SUMA REST PROD DIVI
%token   LENT
%token   LREA
%token   LCAR
%token   LCAD
%token   COME
%token   ACCI
%token   ALGO
%token   CONS
%token   CONT
%token   DRDE
%token   DDEV
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
%token   DRNO
%token   PARA
%token   REAL
%token   DREF
%token   DSAL
%token   DRSI
%token   TABL
%token   TIPO
%token   TUPL
%token   DVAR
%token   ENTO
%token   COMP
%token   ENSA
%token   SEPA
%token   SUBR
%token   DEFT
%token   CREA
%token   SINO
%token   INAR
%token   FINA
%token   <cadena>   IDEN
%token   <cadena>   IBOO
%token   ASIG
%token   SECU
%token   PUNT
%token   APER
%token   CIER
%token   BOOL
%token   ENTE
%token   CHAR
%token   CADE
%type <tipo>   d_tipo
%type <tipo>   lista_id
%type <tipo>   tipo_base
%type <exp>   expresion
%type <op_a>  exp_a
%type <op_a> operando


//-- GRAMMAR RULES ---------------------------------------
%%
desc_algoritmo : ALGO IDEN SECU cabecera_alg bloque_alg FALG PUNT {
   printf("desc_algoritmo \n");
   printf ("Terminado. Imprimo la tabla de simbolos\n");
   print_TS(&MitablaSim);
   printf ("Imprimo la tabla de cuadruplas\n");
   print_QT(&MitablaCuad);
   }
   ;

cabecera_alg   : decl_globales decl_a_f decl_ent_sal COME {printf("cabecera_alg \n");}
               ;

bloque_alg     : bloque COME {printf("bloque_alg \n");}
               ;

decl_globales  : declaracion_tipo decl_globales {printf("decl_globales_1 \n");}
               | declaracion_const decl_globales {printf("decl_globales_2 \n");}
               | /*epsilon*/ {printf("decl_globales_epsilon \n");}
               ;

decl_a_f: accion_d decl_a_f   {printf("decl_a_f_1 \n");}
         | funcion_d decl_a_f  {printf("decl_a_f_2 \n");}
         | /*epsilon*/   {printf("decl_a_f_epsilon \n");}
         ;

bloque:  declaraciones instrucciones {printf("bloque \n");}
      ;

declaraciones  : declaracion_tipo declaraciones {printf("declaraciones_1 \n");}
               | declaracion_const declaraciones   {printf("declaraciones_2 \n");}
               | declaracion_var declaraciones  {printf("declaraciones_3 \n");}
               | /*epsilon*/  {printf("declaraciones_epsilon \n");}
               ;

declaracion_tipo  : TIPO lista_d_tipo FTIP SECU {printf("declaracion_tipo \n");}
                  ;

declaracion_const : CONS lista_d_cte FCON SECU  {printf("declaracion_const \n");}
                  ;

declaracion_var   : DVAR lista_d_var FVAR    {printf("declaracion_var \n");}
                  ;

lista_d_tipo      : IDEN CREA d_tipo SECU lista_d_tipo   {printf("d_lista_tipo \n");}
                  | /*epsilon*/  {printf("d_lista_tipo_epsilon \n");}
                  ;

d_tipo            : TUPL lista_campos FTUP   {printf("d_tipo_1.1 \n");$$=V_OTRO;}
                  | TABL INAR expresion_t SUBR expresion_t FINA DRDE d_tipo   {printf("d_tipo_1.2 \n");$$=V_OTRO;}
                  | IDEN   {printf("d_tipo_2.1 \n");$$=V_OTRO;}
                  | expresion_t SUBR expresion_t   {printf("d_tipo_2.2 \n");$$=V_OTRO;}
                  | DREF d_tipo  {printf("d_tipo_2.3 \n");$$=V_OTRO;}
                  | tipo_base   {printf("d_tipo_2.4 \n");$$=$1;}
                  ;

tipo_base         :BOOL {printf("Una variable de tipo BOOLEANO \n");$$=V_BOOLE;}
                  |ENTE {printf("Una variable de tipo ENTERO \n");$$=V_ENTE;}
                  |CHAR {printf("Una variable de tipo CARACTER \n");$$=V_CHAR;}
                  |CADE {printf("Una variable de tipo CADENA \n");$$=V_CADENA;}
                  |REAL {printf("Una variable de tipo REAL \n");$$=V_REAL;}
                  ;

expresion_t       : expresion {printf("expresion_t_1 \n");}
                  | LCAR   {printf("expresion_t_2 \n");}
                  ;

lista_campos      : IDEN DEFT d_tipo SECU lista_campos   {printf("lista_campos \n");}
                  | /*epsilon*/  {printf("lista_campos_epsilon \n");}
                  ;

lista_d_cte       : IDEN CREA LENT SECU lista_d_cte {printf("lista_d_cte_entera \n");}
                  | IDEN CREA LREA SECU lista_d_cte {printf("lista_d_cte_real \n");}
                  | IDEN CREA LCAR SECU lista_d_cte {printf("lista_d_cte_caracter \n");}
                  | IDEN CREA LCAD SECU lista_d_cte {printf("lista_d_cte_cadena \n");}
                  | IBOO CREA LBOO SECU lista_d_cte {printf("lista_d_cte_booleano \n");}
                  | /*epsilon*/   {printf("lista_d_cte_epsilon \n");}
                  ;

lista_d_var       : lista_id DEFT IDEN SECU lista_d_var  {printf("lista_d_var_1 \n"); /*cambia_tipo(&MitablaSim,$3);*/}
                  | lista_id DEFT IBOO SECU lista_d_var  {printf("lista_d_var_booleano \n");}
               | lista_id DEFT d_tipo SECU lista_d_var {printf("lista_d_var_2 \n"); cambia_tipo(&MitablaSim,$3); /*AQUI EL PROBLEMA??? ¿$1=$3;?*/}
                  | /*epsilon*/   {printf("lista_d_var_epsilon \n");}
                  ;

lista_id          : IDEN SEPA lista_id  {printf("lista_id_1 \n"); if (insert_var_TS(&MitablaSim, $1, $3) <0){printf("Variable ya definida \n");} $$ = $3;}
                  | IDEN   {printf("lista_id_2 \n"); if (insert_var_TS(&MitablaSim, $1, V_TEMP)<0){printf("Variable ya definida \n");} $$=V_TEMP;}
                  | IBOO SEPA lista_id  {printf("lista_id_3_Bool \n");if (insert_var_TS(&MitablaSim, $1, $3)<0){printf("Variable ya definida \n");} $$ = $3;}
                  | IBOO   {printf("lista_id_4_Bool \n");if (insert_var_TS(&MitablaSim, $1, V_BOOLE)<0){printf("Variable ya definida \n");} $$=V_BOOLE; }
                  ;

decl_ent_sal      : decl_ent  {printf("decl_ent_sal_1 \n");}
                  | decl_ent decl_sal   {printf("decl_ent_sal_2 \n");}
                  | decl_sal   {printf("decl_ent_sal_3 \n");}
                  ;

decl_ent          : ENTR lista_d_var {printf("decl_ent \n");}
                  ;

decl_sal          : DSAL lista_d_var {printf("decl_sal \n");}
                  ;

expresion         : exp_a  {
                     printf("expresion_1 \n");
                     $$.tipo=EXP_ARITMETICA;
                     $$.a.id=$1.id;
                     $$.a.tipo=$1.tipo;
                  }
                  | exp_b   {printf("expresion_2 \n");}
                  | funcion_ll {printf("expresion_3 \n");}
                  ;

exp_a             : exp_a SUMA exp_a   {
                     if($1.tipo==V_ENTE && $3.tipo==V_ENTE){
                        printf("Expresion aritmetica: Suma de 2 enteros \n");
                        int resul=insert_var_TS(&MitablaSim,"",V_ENTE);
                        insert_QT(&MitablaCuad,OP_SUMA_ENTERO,$1.id,$3.id,resul);
                        $$.id=resul;
                        $$.tipo=V_ENTE;
                     }else if($1.tipo==V_REAL && $3.tipo==V_REAL){
                        printf("Expresion aritmetica: Suma de 2 reales \n");
                        int resul=insert_var_TS(&MitablaSim,"",V_REAL);
                        insert_QT(&MitablaCuad,OP_SUMA_REAL,$1.id,$3.id,resul);
                        $$.id=resul;
                        $$.tipo=V_REAL;
                     }else if($1.tipo==V_ENTE && $3.tipo==V_REAL){
                        printf("Expresion aritmetica: Suma de 1 entero (1º) y un real \n");
                        int op1=insert_var_TS(&MitablaSim,"",V_REAL);
                        insert_QT(&MitablaCuad,OP_ENTERO2REAL,$1.id,OP_NULL,op1);
                        int resul=insert_var_TS(&MitablaSim,"",V_REAL);
                        insert_QT(&MitablaCuad,OP_SUMA_REAL,op1,$3.id,resul);
                        $$.id=resul;
                        $$.tipo=V_REAL;
                     }else if($1.tipo==V_REAL && $3.tipo==V_ENTE){
                        printf("Expresion aritmetica: Suma de 1 entero (2º) y un real \n");
                        int op2=insert_var_TS(&MitablaSim,"",V_REAL);
                        insert_QT(&MitablaCuad,OP_ENTERO2REAL,$3.id,OP_NULL,op2);
                        int resul=insert_var_TS(&MitablaSim,"",V_REAL);
                        insert_QT(&MitablaCuad,OP_SUMA_REAL,$1.id,op2,resul);
                        $$.id=resul;
                        $$.tipo=V_REAL;
                     }
                  }
                  | exp_a REST exp_a   {printf("exp_a_resta \n");}
                  | exp_a PROD exp_a   {printf("exp_a_multiplicacion \n");}
                  | exp_a DIVI exp_a   {printf("exp_a_division \n");}
                  | exp_a DMOD exp_a   {printf("exp_a_mod \n");}
                  ;

exp_a             : exp_a DDIV exp_a   {printf("exp_a_div \n");}
                  | APER exp_a CIER  {printf("exp_a_(exp_a) \n");}
                  | operando   {
                     $$=$1;
                     printf("exp_a_operando \n");
                  }
                  | LENT   {printf("exp_a_entero \n");}
                  | LREA  {printf("exp_a_real \n");}
                  | REST exp_a {printf("exp_a_-exp_a \n");}
                  ;

exp_b             : exp_b DAND exp_b {printf("exp_b_AND \n");}
                  | exp_b DROR exp_b {printf("exp_b_OR \n");}
                  | DRNO exp_b {printf("exp_b_NO \n");}
                  | operandob   {printf("exp_b_Booleano \n");}
                  | LBOO   {printf("exp_b_litBooleano \n");}
                  ;

exp_b             : expresion COMP expresion {printf("exp_b_COMP \n");}
                  | expresion CREA expresion {printf("exp_b_CREA \n");}
                  | APER exp_b CIER  {printf("exp_b_(exp_b) \n");}
                  ;

operando          : IDEN   {
                     printf("operando_1 \n");
                     symbol_node *nodo = get_var(&MitablaSim, $1);
                     $$.id=nodo->pos;
                     $$.tipo=nodo->sym.var.tipo;
                  }
                  | operando PUNT operando   {printf("operando_2 \n");}
                  | operando INAR expresion FINA {printf("operando_3 \n");}
                  | operando DREF   {printf("operando_4 \n");}
                  ;

operandob         : IBOO   {printf("operando booleano \n");}
                  ;

instrucciones     : instruccion SECU instrucciones {printf("instrucciones_1 \n");}
                  | instruccion  {printf("instrucciones_2 \n");}
                  ;

instruccion       : CONT   {printf("instruccion_1 \n");}
                  | asignacion   {printf("instruccion_2 \n");}
                  | alternativa  {printf("instruccion_3 \n");}
                  | iteracion {printf("instruccion_4 \n");}
                  | accion_ll {printf("instruccion_5 \n");}
                  ;

asignacion        : operando ASIG expresion  {printf("asignacion \n");}
                  | operandob ASIG expresion  {printf("asignacion literal booleano\n");}
                  ;

alternativa       : DRSI expresion ENTO instrucciones lista_opciones DFSI  {printf("alternativa \n");}
                  ;

lista_opciones    : SINO expresion ENTO instrucciones lista_opciones   {printf("lista_opciones_1 \n");}
                  | /*epsilon*/  {printf("lista_opciones_epsilon \n");}
                  ;

iteracion         : it_cota_fija {printf("iteracion_1 \n");}
                  | it_cota_exp  {printf("iteracion_2 \n");}
                  ;

it_cota_exp       : MIEN expresion HACE instrucciones FMIE  {printf("it_cota_exp \n");}
                  ;

it_cota_fija      : PARA IDEN ASIG expresion HAST expresion HACE instrucciones FPAR {printf("it_cota_fija \n");}
                  |PARA IBOO ASIG expresion HAST expresion HACE instrucciones FPAR {printf("it_cota_fija \n");}
                  ;

accion_d          : ACCI a_cabecera bloque FACC {printf("accion_d \n");}
                  ;

funcion_d         : FUNC f_cabecera bloque DDEV expresion FFUN {printf("funcion_d \n");}
                  ;

a_cabecera        : IDEN APER d_par_form CIER SECU  {printf("a_cabecera \n");}
                  ;

f_cabecera        : IDEN APER lista_d_var CIER DDEV d_tipo SECU   {printf("f_cabecera \n");}
                  ;

d_par_form        : d_p_form SECU d_par_form {printf("d_par_form_1 \n");}
                  | /*epsilon*/  {printf("d_par_form_epsilon \n");}
                  ;

d_p_form          : ENTR lista_id DEFT d_tipo   {printf("d_p_form_1 \n");}
                  | DSAL lista_id DEFT d_tipo   {printf("d_p_form_2 \n");}
                  | ENSA lista_id DEFT d_tipo   {printf("d_p_form_3 \n");}
                  ;

accion_ll         : IDEN APER l_ll CIER   {printf("accion_ll \n");}
                  ;

funcion_ll        : IDEN APER l_ll CIER   {printf("funcion_ll \n");}
                  ;

l_ll              : expresion SEPA l_ll   {printf("l_ll_1 \n");}
                  | expresion {printf("l_ll_2 \n");}
                  ;
%%
//-- FUNCTION DEFINITIONS ---------------------------------
int main( int argc, char **argv ){
   ++argv, --argc;  /* skip over program name */
   init_TS(&MitablaSim);
   init_QT(&MitablaCuad);
   if ( argc > 0 )
      yyin = fopen( argv[0], "r" );
   else
      yyin = stdin;
   yyparse();
}
void yyerror(const char* s){
   fprintf(stderr,"Parse error: %s\n", s);
}
