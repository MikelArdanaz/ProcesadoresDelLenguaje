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
    V_CADENA
} tipo_variables;

const static char* tipo_variables_nombres[] = {
    "ENTERO",
    "REAL",
    "BOOLEANO",
    "CARACTER",
    "CADENA"
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
    // funcion fun;
    // tipo tip;
} symbol;

typedef struct symbol_node {
    int id;
    sym_tipo tipo;
    symbol sym;
    struct symbol_node *next;
} symbol_node;

typedef struct {
    int size;
    symbol_node *sym_list;
} tablaSim;

symbol_node *last;

/**
 * Inicializar la tabla de símbolos
 */
void init_TS(tablaSim *);

/**
 * Imprimir la tabla de símbolos completa
 */
void print_TS(tablaSim *);

/**
 * Insertar un nuevo símbolo en la tabla
 */
int insert_TS(tablaSim *, symbol, sym_tipo);

/**
 * Insertar una nueva varaible como símbolo de la tabla
 */
int insert_var_TS(tablaSim *, char *, tipo_variables);

/**
 * Comprueba la existencia de una variable del mismo nombre
 */
int exists_var(tablaSim *, char *);

/**
 * Obtiene la referencia a la variable del mismo nombre
 */
symbol_node *get_var(tablaSim *, char *);

#endif
