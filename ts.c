#include "ts.h"
//Inicializamos la tabla de símbolos
void init_TS(tablaSim *Tabla){
   Tabla->size=0;
   Tabla->sym_list=NULL;
   last=Tabla->sym_list;
}
//Imprimir Tabla de Simbolos
void print_TS(tablaSim *Tabla){
   symbol_node *temp = Tabla->sym_list;
   while (temp!=NULL) {
      printf("pos: %d\n",temp->pos);
      printf("Tipo de la variable: %s\n",tipo_variables_nombres[temp->sym.var.tipo]);
      if (strcmp("", temp->sym.var.nombre) != 0)
         printf("Nombre de la variable: %s\n",temp->sym.var.nombre);
      temp=temp->next;
   }
}
//Insertar simbolo en la tabla
int insert_TS(tablaSim *Tabla, symbol NuevoSim, sym_tipo TipoSim){
   symbol_node *temp=malloc(sizeof(symbol_node));
   temp->next=NULL;
   temp->tipo=TipoSim;
   temp->pos=Tabla->size;
   temp->sym=NuevoSim;
   if (Tabla->sym_list == NULL) {
      Tabla->sym_list = temp;
      last = Tabla->sym_list;
   }else{
      last->next=temp;
      last=last->next;
   }
   Tabla->size+=1;
   return last->pos;
}
//Insertar variable como simbolo de la tabla
int insert_var_TS(tablaSim *Tabla, char *Nombre, tipo_variables tipo){
   if (strcmp("",Nombre)!=0 && exists_var(Tabla,Nombre))
      return -1;
   symbol new_sym;
   new_sym.var.nombre = (char *) malloc(sizeof(char) * strlen(Nombre));
   strcpy(new_sym.var.nombre, Nombre);
   new_sym.var.tipo = tipo;
   return insert_TS(Tabla, new_sym, SYM_VARIABLE);
}
//Chequea si ya existe una variable con ese nombre en nuestra tabla de simbolos
int exists_var(tablaSim *Tabla, char *Nombre){
   return get_var(Tabla,Nombre)!=NULL;
}
//Obtiene la referencia a la variable del mismo nombre.Devuelve NULL si no existe
symbol_node *get_var(tablaSim *Tabla, char *Nombre){
   symbol_node *temp=Tabla->sym_list;
   while (temp !=NULL) {
      if (temp->tipo == SYM_VARIABLE && strcmp(temp->sym.var.nombre,Nombre)==0) {
         return temp;
      }
      temp = temp->next;
   }
   return NULL;
}
void cambia_tipo(tablaSim *Tabla,tipo_variables Newtipo){
   symbol_node *temp=Tabla->sym_list;
   while (temp !=NULL) {
      if (temp->sym.var.tipo==V_TEMP) {
         temp->sym.var.tipo=Newtipo;
      }
      temp = temp->next;
   }
}
