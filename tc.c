#include <stdio.h>
#include "tc.h"
void init_QT(tablaCuad *Tabla){
   Tabla->size=0;
}
void print_QT(tablaCuad *Tabla){
   for (int i=0;i<Tabla->size;i++){
      printf("Cuadrupla %d op: %s arg1: %d arg2: %d resul: %d \n",i,
      operador_nombres[Tabla->array[i].op],Tabla->array[i].arg1,
      Tabla->array[i].arg2,Tabla->array[i].resul);
   }
}
int insert_QT(tablaCuad *Tabla, operador op, int arg1, int arg2, int resul){
   Tabla->array[Tabla->size].op = op;
   Tabla->array[Tabla->size].arg1 = arg1;
   Tabla->array[Tabla->size].arg2 = arg2;
   Tabla->array[Tabla->size].resul = resul;
   Tabla->size ++;
   return Tabla->size - 1;
}
