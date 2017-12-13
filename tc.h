#ifndef MJ_TC_H
#define MJ_TC_H "ts.h"
//Definicion de los operadores a almacenar en la tabla de cuadruplas
typedef enum
{
    OP_ASIGNACION,
    OP_SUMA_ENTERO,
    OP_SUMA_REAL,
    OP_RESTA_ENTERO,
    OP_RESTA_REAL,
    OP_PRODUCTO_ENTERO,
    OP_PRODUCTO_REAL,
    OP_DIVISION_ENTERO,
    OP_DIVISION_REAL,
    OP_MODULO,
    OP_MENOS_ENTERO,
    OP_MENOS_REAL,
    OP_ENTERO2REAL,
    OP_BOOL_AND,
    OP_BOOL_OR,
    OP_BOOL_NOT,
    OP_BOOL_DISTINTO,
    OP_BOOL_IGUAL,
    OP_BOOL_MENOR,
    OP_BOOL_MENOR_IGUAL,
    OP_BOOL_MAYOR,
    OP_BOOL_MAYOR_IGUAL,
    OP_GOTO,
    OP_CONDICIONAL_GOTO
} operador;

const static char* operador_nombres[] = {
    "ASIGNACION",
    "SUMA ENTERA",
    "SUMA REAL",
    "RESTA ENTERA",
    "RESTA REAL",
    "PRODUCTO ENTERO",
    "PRODUCTO REAL",
    "DIVISION ENTERA",
    "DIVISION REAL",
    "MODULO",
    "MENOS ENTERO",
    "MENOS REAL",
    "ENTERO 2 REAL",
    "BOOL AND",
    "BOOL OR",
    "BOOL NOT",
    "BOOL DISTINTO",
    "BOOL IGUAL",
    "BOOL MENOR",
    "BOOL MENOR IGUAL",
    "BOOL MAYOR",
    "BOOL MAYOR IGUAL",
    "OP_GOTO",
    "OP_CONDICIONAL_GOTO"
};
//Definición de la cuadrupla
typedef struct {
   int op;
   int arg1;
   int arg2;
   int resul;
} quad
typedef struct {
   int size;
   quad array[100];
}tablaCuad;
//Inicializar tabla de cuadruplas
void init_QT(tablaCuad *);
//Imprimir tabla de cuadruplas
void print_QT(tablaCuad *);
//Insertar en tabla de cuadruplas
int insert_QT(tablaCuad *, operador, int, int, int);
#endif
