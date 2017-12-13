#ifndef MJ_TC_H
#define MJ_TC_H "ts.h"

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
