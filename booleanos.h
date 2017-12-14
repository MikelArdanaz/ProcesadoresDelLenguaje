#ifndef MJ_BOOLEANOS_H
#define MJ_BOOLEANOS_H "booleanos.h"
#include "tc.h"

typedef struct{
    int size;
    int *array;
}bool_list;
typedef struct {
   bool_list verdadero;
   bool_list falso;
}op_booleano;
//Completa todas las cuadruplas de la lista haciendo que salten a la cuadrupla pasada
void backpatch(tablaCuad *, bool_list, int);
//Devuelve la lista union de todas las listas
bool_list merge(bool_list, bool_list);
//devuelve una lista con el entero pasado como unico elemento
bool_list makelist(int);

#endif
