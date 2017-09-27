/* Practica 1 Procesadores del lenguaje */
mayuscula [A-Z]
minuscula [a-z]
letra {mayuscula}|{minuscula}
cifra [0-9]
letra_o_cifra {letra}|{cifra}
identificador {letra}|{letra_o_cifra}*
literal_entero  (+|−)?{cifra} {cifra}*((e|E){cifra} {cifra}*)?
literal_real  (+|−)?{cifra} {cifra}*(.{cifra} {cifra}*)?((e|E){cifra} {cifra}*)?
literal_booleano  verdadero|falso
literal_caracter  "([^"])*"
literal_cadena '([^']*|/')*'
comentario {([^}]*|/})*}
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
dr_igual_asig =
dr_comparacion {dr_menor}|{dr_menor_o_igual}|{dr_mayor}|{dr_mayor_o_igual}|{dr_distinto}|{dr_igual_comp}
dr_suma \+
dr_resta -
dr_prod  \*
%%
{cifra}+    {printf("Una cifra");}
{dr_mayor}  {printf("Un signo >");}
{dr_suma}  {printf("Un signo +");}
{dr_resta}  {printf("Un signo -");}
{dr_prod}  {printf("Un signo *");}
{identificador}  {printf("Un identificador");}
{dr_entsal}  {printf("Un e/s");}
%%
