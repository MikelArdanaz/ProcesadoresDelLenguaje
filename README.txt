####################################################
#   Proyecto Procesadores Del Lenguaje UPNA 2017   #
####################################################

             Autores
-------------------------------
    
 - Mikel Ardanaz
 - Jaime Elcarte

           Descripci�n
---------------------------------
Construcci�n de un compilador del lenguaje ProAlg para la asignatura Procesadores del Lenguaje, perteneciente al 
Grado en Ingenier�a Inform�tica impartido en la Universidad Publica de Navarra (UPNA).


                Uso
---------------------------------

Se dispone de un Makefile a partir del cual podemos construir el compilador desarrollado. Para probar los ejemplos
utilizados durante el desarrollo de esta pr�ctica, abrimos un terminal en la ra�z del proyecto y ejecutamos:

$ make
$ ./compilador ejemplo.alg

Una vez ejecutado, se mostrar� por pantalla una lista de todos los tokens y definiciones regulares detectados. 
Se mostrar�n tambi�n las tablas de s�mbolos y cu�druplas al final de la ejecuci�n, que seran guardadas en los 
archivos 'tabla_simbolos' y 'tabla_cuadruplas' respectivamente. En el archivo 'parser.output' se guardar� informaci�n
referente a las operaciones de desplazamiento y reducci�n realizadas.


              Logros
---------------------------------

Scanner:

 - Es capaz de detectar todos los tokens especificados por la gram�tica del lenguaje ProAlg, ya sean palabras reservadas,
   identificadores, operadores aritm�ticos y booleanos, etc�tera.

 - Es case insensitive, es decir, no diferencia entre may�sculas y min�sculas.

 - Asocia a la variable 'YYLVAL' los valores necesarios para el correcto funcionamiento del parser.

Parser:

 - Recibe los tokens detectados por el scanner y realiza operaciones shift y reduce mientras reconoce las expresiones de 
   la gram�tica. Es capaz de reconocer la estructura completa de cualquier algoritmo de ProAlg, diferenciando los distintos 
   componentes y subcomponentes de dicha estructura.

 - Mediante la librer�a ts, reconoce la definici�n de variables en el algoritmo y las almacena en la tabla de s�mbolos.

 - Utiliza la librer�a tc para la construcci�n de c�digo de tres direcciones, que es almacenado en la tabla de cu�druplas.

 - Dispone del 'YYSTYPE', un 'union' que puede contener literales, operadores aritm�ticos o booleanos, o estructuras de mayor complejidad.

 - Se han definido prioridades en los tokens y asociatividades en los operadores aritm�ticos para la resoluci�n de conflictos 
   de desplazamiento y reducci�n. Finalmente, tenemos 12 conflictos shift-reduce y 6 conflictos reduce-reduce, que parecen resolverse 
   correctamente al menos en los ejemplos utilizados durante el desarrollo del proyecto.

 Otras utilidades y comentarios:

 - Modelo Fortran: se ha realizado una peque�a variaci�n en la gram�tica especificada, debido a la necesidad de diferenciar las 
                   expresiones aritm�ticas de las booleanas en el parser, de forma que las variables booleanas deben empezar por b o B.

 - Librer�a booleanos: LO RELLENAR� MIKEL.

 Porcentaje de trabajo imputable
---------------------------------

 - Mikel Ardanaz: 60%
 - Jaime Elcarte: 40%
