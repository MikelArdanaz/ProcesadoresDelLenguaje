#include "booleanos.h"
void backpatch(tablaCuad *Tabla, bool_list lista, int quad){
   for (int i=0; i<lista.size;i++) {
      Tabla->array[lista.array[i]].resul=quad;
   }
}
bool_list makelist(int quad){
   bool_list lista;
   lista.size=1;
   lista.array=malloc(sizeof(int));
   lista.array[0]=quad;
   return lista;
}
bool_list merge(bool_list lista1, bool_list lista2){
   bool_list listaFinal;
   listaFinal.size=lista1.size+lista2.size;
   listaFinal.array=malloc(listaFinal.size*sizeof(int));
   for(int i=0;i<lista1.size;i++) {
      listaFinal.array[i]=lista1.array[i];
   }
   for(int i=0;i<lista2.size;i++) {
      listaFinal.array[lista1.size+i]=lista2.array[i];
   }
   return listaFinal;
}
