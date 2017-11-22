#ifndef STRUCTS_H
#define STRUCTS_H

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

//Expresiones
typedef enum {
    E_ARITMETICO,
    E_BOOLEANO
} tipo_expresiones;

const static char* tipo_expresiones_nombres[] = {
    "ARITMETICO",
    "BOOLEANO"
};

//Operadores
typedef enum
{
    OP_ASIGNACION,
    // Operadores aritméticos
    OP_SUMA_ENTERO,
    OP_SUMA_REAL,
    OP_RESTA_ENTERO,
    OP_RESTA_REAL,
    OP_PRODUCTO_ENTERO,
    OP_PRODUCTO_REAL,
    OP_DIVISION_ENTERO,
    OP_DIVISION_REAL,
    OP_MODDULO,
    OP_MENOS_ENTERO,
    OP_MENOS_REAL,
    OP_ENTERO2REAL,
    // Operadores booleanos
    OP_BOOL_AND,
    OP_BOOL_OR,
    OP_BOOL_NOT,
    OP_BOOL_DISTINTO,
    OP_BOOL_IGUAL,
    OP_BOOL_MENOR,
    OP_BOOL_MENOR_IGUAL,
    OP_BOOL_MAYOR,
    OP_BOOL_MAYOR_IGUAL,
} operador;

const static char* operador_nombres[] = {
    "ASIGNACION         ",

    // Operadores aritméticos
    "SUMA ENTERA        ",
    "SUMA REAL          ",
    "RESTA ENTERA       ",
    "RESTA REAL         ",
    "PRODUCTO ENTERO    ",
    "PRODUCTO REAL      ",
    "DIVISION ENTERA    ",
    "DIVISION REAL      ",
    "MODDULO            ",
    "MENOS ENTERO       ",
    "MENOS REAL         ",
    "ENTERO 2 REAL      ",

    // Operadores booleanos
    "BOOL AND           ",
    "BOOL OR            ",
    "BOOL NOT           ",
    "BOOL DISTINTO      ",
    "BOOL IGUAL         ",
    "BOOL MENOR         ",
    "BOOL MENOR IGUAL   ",
    "BOOL MAYOR         ",
    "BOOL MAYOR IGUAL   ",
};

/**
  * Struct para la lista de verdadero y falso
  *
  * - size: tamaño de la lista
  *
  * - array: lista de identificadores de quads
  */
typedef struct {
    int size;
    int *array;
} bool_list;

/**
  * Struct para los operadores aritméticos
  *
  * - id: es el valor que identifica al
  *       operador en la tabla de símbolos
  *
  * - tipo: identifica el tipo del operador
  */
typedef struct {
    int id;
    tipo_variables tipo;
} op_aritmetico;

/**
  * Struct para los operadores boolenaos
  *
  * - verdadero: lista de saltos (ids a la tabla de cuadruplas)
  *              cuando el operador se evalue a verdadero
  *
  * - falso: lista de saltos (ids a la tabla de cuadruplas)
  *          cuando el operador se evalue a falso
  */
typedef struct {
    bool_list verdadero;
    bool_list falso;
} op_booleano;

/**
  * Estructura de una expresión
  *
  * - tipo: tipo de la expresión
  * - a: datos de la expresión aritmética
  * - b: datos de la expresión booleana
  */
typedef struct {
    tipo_expresiones tipo;
    op_aritmetico a;
    op_booleano b;
} expresion;

#endif
