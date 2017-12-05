#ifndef MJ_TS_H
#define MJ_TS_H "definiciones.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//Tipos de una variable
typedef enum {
    V_ENTE,
    V_REAL,
    V_BOOLE,
    V_CHAR,
    V_CADENA,
    V_OTRO,
    V_TEMP
} tipo_variables;

const static char* tipo_variables_nombres[] = {
    "ENTERO",
    "REAL",
    "BOOLEANO",
    "CARACTER",
    "CADENA",
    "OTRO",
    "TEMPORAL"
};

typedef enum {
    SYM_VARIABLE,
    SYM_FUNCION,
    SYM_TIPO
} sym_tipo;

typedef struct {
    char *nombre;
    tipo_variables tipo;
} variable;

typedef union {
    variable var;
} symbol;

typedef struct symbol_node {
    int pos;
    sym_tipo tipo;
    symbol sym;
    struct symbol_node *next;
} symbol_node;

typedef struct {
    int size;
    symbol_node *sym_list;
} tablaSim;

symbol_node *last;

//Inicializamos la tabla de símbolos
void init_TS(tablaSim *);
//Imprimir Tabla de Simbolos
void print_TS(tablaSim *);
//Cambia el tipo de las variables con tipo temporal por el tipo pasado como argumento
void cambia_tipo(tablaSim *,tipo_variables);
//Insertar simbolo en la tabla
int insert_TS(tablaSim *, symbol, sym_tipo);
//Insertar variable como simbolo de la tabla
int insert_var_TS(tablaSim *, char *, tipo_variables);
//Chequea si ya existe una variable con ese nombre en nuestra tabla de simbolos
int exists_var(tablaSim *, char *);
//Obtiene la referencia a la variable del mismo nombre
symbol_node *get_var(tablaSim *, char *);

#endif
