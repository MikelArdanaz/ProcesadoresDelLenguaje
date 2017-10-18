/* Practica 1 Procesadores del lenguaje */
mayuscula [A-Z]
minuscula [a-z]
letra {mayuscula}|{minuscula}
cifra [0-9]
letra_o_cifra {letra}|{cifra}
identificador {letra}{letra_o_cifra}*
literal_entero (\+|\−)?{cifra}{cifra}*((e|E){cifra}{cifra}*)?
literal_real  (\+|\−)?{cifra}{cifra}*(\.{cifra}{cifra}*)?((e|E){cifra}{cifra}*)?
literal_caracter  \".\"
literal_cadena '([^']*|\/')*'
comentario \{([^\}]*|\/\})*\}
dr_accion   accion
dr_algoritmo   algoritmo
dr_booleano booleano
dr_cadena   cadena
dr_caracter caracter
dr_const const
dr_continuar   continuar
dr_de de
dr_dev   dev
dr_div   div
dr_ent   ent
dr_entero   entero
dr_entsal  e\/s
dr_faccion  faccion
dr_falgoritmo  falgoritmo
dr_falso falso
dr_fconst   fconst
dr_ffuncion ffuncion
dr_fmientras   fmientras
dr_fpara fpara
dr_fsi   fsi
dr_ftipo ftipo
dr_ftupla   ftupla
dr_funcion  funcion
dr_fvar  fvar
dr_hacer hacer
dr_hasta hasta
dr_mientras mientras
dr_mod   mod
dr_no no
dr_o  o
dr_para  para
dr_real  real
dr_ref   ref
dr_sal   sal
dr_si si
dr_tabla tabla
dr_tipo  tipo
dr_tupla tupla
dr_var   var
dr_verdadero   verdadero
dr_y  y
dr_menor <
dr_menor_o_igual  <=
dr_mayor >
dr_mayor_o_igual  >=
dr_distinto <>|!=
dr_igual_comp ==
dr_comparacion {dr_menor}|{dr_menor_o_igual}|{dr_mayor}|{dr_mayor_o_igual}|{dr_distinto}|{dr_igual_comp}
dr_suma \+
dr_resta \-
dr_prod  \*
dr_asignacion  :=
dr_composicion_secuencial  ;
dr_separador   ,
dr_subrango \.\.
dr_deftipo  :
dr_creatipo =
dr_entonces \->
dr_si_no_si \[\]
dr_inicio_array   \[
dr_fin_array   \]
literal_booleano  {dr_verdadero}|{dr_falso}
dr_tipobase {dr_booleano}|{dr_entero}|{dr_caracter}|{dr_cadena}|{dr_real}
dr_punto \.
%%
{literal_entero}  {printf("Un literal entero: %s\n",yytext);return (LENT);}
{literal_real} {printf("Un literal real: %s\n",yytext);return (LREA);}
{literal_caracter}   {printf("Un literal caracter: %s\n",yytext);return (LCAR);}
{literal_cadena}  {printf("Un literal cadena: %s\n",yytext);return (LCAD);}
{comentario}   {printf("Un comentario: %s\n",yytext);return (COME);}
{dr_accion} {printf("Una palabra reservada: %s\n",yytext);return (ACCI);}
{dr_algoritmo} {printf("Una palabra reservada: %s\n",yytext);return (ALGO);}
{dr_tipobase}  {printf("Una palabra reservada: %s\n",yytext);return (BASE);}
{dr_const}  {printf("Una palabra reservada: %s\n",yytext);return (CONS);}
{dr_continuar} {printf("Una palabra reservada: %s\n",yytext);return (CONT);}
{dr_de}  {printf("Una palabra reservada: %s\n",yytext);return (DRDE);}
{dr_dev} {printf("Una palabra reservada: %s\n",yytext);return (DDEV);}
{dr_div} {printf("Una palabra reservada: %s\n",yytext);return (DDIV);}
{dr_ent} {printf("Una palabra reservada: %s\n",yytext);return (ENTR);}
{dr_faccion}   {printf("Una palabra reservada: %s\n",yytext);return (FACC);}
{dr_falgoritmo}   {printf("Una palabra reservada: %s\n",yytext);return (FALG);}
{literal_booleano}   {printf("Un literal booleano: %s\n",yytext);return (LBOO);}
{dr_fconst} {printf("Una palabra reservada: %s\n",yytext);return (FCON);}
{dr_ffuncion}  {printf("Una palabra reservada: %s\n",yytext);return (FFUN);}
{dr_fmientras} {printf("Una palabra reservada: %s\n",yytext);return (FMIE);}
{dr_fpara}  {printf("Una palabra reservada: %s\n",yytext);return (FPAR);}
{dr_fsi} {printf("Una palabra reservada: %s\n",yytext);return (DFSI);}
{dr_ftipo}  {printf("Una palabra reservada: %s\n",yytext);return (FTIP);}
{dr_ftupla} {printf("Una palabra reservada: %s\n",yytext);return (FTUP);}
{dr_funcion}   {printf("Una palabra reservada: %s\n",yytext);return (FUNC);}
{dr_fvar}   {printf("Una palabra reservada: %s\n",yytext);return (FVAR);}
{dr_hacer}  {printf("Una palabra reservada: %s\n",yytext);return (HACE);}
{dr_hasta}  {printf("Una palabra reservada: %s\n",yytext);return (HAST);}
{dr_mientras}  {printf("Una palabra reservada: %s\n",yytext);return (MIEN);}
{dr_mod} {printf("Una palabra reservada: %s\n",yytext);return (DMOD);}
{dr_no}  {printf("Una palabra reservada: %s\n",yytext);return (DRNO);}
{dr_o}   {printf("Una palabra reservada: %s\n",yytext);return (DROR);}
{dr_para}   {printf("Una palabra reservada: %s\n",yytext);return (PARA);}
{dr_ref} {printf("Una palabra reservada: %s\n",yytext);return (DREF);}
{dr_sal} {printf("Una palabra reservada: %s\n",yytext);return (DSAL);}
{dr_si}  {printf("Una palabra reservada: %s\n",yytext);return (DRSI);}
{dr_tabla}  {printf("Una palabra reservada: %s\n",yytext);return (TABL);}
{dr_tipo}   {printf("Una palabra reservada: %s\n",yytext);return (TIPO);}
{dr_tupla}  {printf("Una palabra reservada: %s\n",yytext);return (TUPL);}
{dr_var} {printf("Una palabra reservada: %s\n",yytext);return (DVAR);}
{dr_y}   {printf("Una palabra reservada: %s\n",yytext);return (DAND);}
{dr_entonces}  {printf ("Un signo de entonces: %s\n",yytext);return (ENTO);}
{dr_comparacion}  {printf("Un signo de comparacion: %s\n",yytext);return (COMP);}
{dr_suma}  {printf("Un signo de suma %s\n",yytext);return (SUMA);}
{dr_resta}  {printf("Un signo de resta %s\n",yytext);return (REST);}
{dr_prod}  {printf("Un signo de producto %s\n",yytext);return (PROD);}
{dr_entsal}  {printf("Un signo de entrada salida :%s\n",yytext);return (ENSA);}
{dr_separador} {printf ("Un separador: %s\n",yytext);return (SEPA);}
{dr_subrango}  {printf ("Un signo de subrango: %s\n",yytext);return (SUBR);}
{dr_deftipo}   {printf ("Un signo de definicion de tipo: %s\n",yytext);return (DEFT);}
{dr_creatipo}  {printf ("Un signo de creacion de tipo: %s\n",yytext);return (CREA);}
{dr_si_no_si}  {printf ("Un signo de si-no-si: %s\n",yytext);return (SINO);}
{dr_inicio_array} {printf ("Un signo de inicio de array: %s\n",yytext);return (INAR);}
{dr_fin_array} {printf ("Un signo de fin de array: %s\n",yytext);return (FINA);}
{identificador}   {printf("Un identificador: %s\n",yytext);return (IDEN);}
{dr_asignacion} {printf("Una asignacion: %s\n",yytext);return (ASIG);}
{dr_composicion_secuencial}   {printf("Composicion secuencial: %s\n",yytext);return (SECU);}
{dr_punto}   {printf("Composicion secuencial: %s\n",yytext);return (PUNT);}
%%
