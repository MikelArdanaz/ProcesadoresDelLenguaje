####################################################
#   Proyecto Procesadores Del Lenguaje UPNA 2017   #
####################################################

             Autores
-------------------------------

 - Mikel Ardanaz
 - Jaime Elcarte

           Descripci�n
---------------------------------
Construcción de un compilador del lenguaje ProAlg para la asignatura Procesadores del Lenguaje, perteneciente al
Grado en Ingeniería Informática impartido en la Universidad Publica de Navarra (UPNA).


                Uso
---------------------------------

Se dispone de un Makefile a partir del cual podemos construir el compilador desarrollado. Para probar los ejemplos
utilizados durante el desarrollo de esta práctica, abrimos un terminal en la raíz del proyecto y ejecutamos:

$ make
$ ./compilador ejemplo.alg

Una vez ejecutado, se mostrará por pantalla una lista de todos los tokens y definiciones regulares detectados.
Se mostrarán también las tablas de símbolos y cuádruplas al final de la ejecución, que seran guardadas en los
archivos 'tabla_simbolos' y 'tabla_cuadruplas' respectivamente. En el archivo 'parser.output' se guardará información
referente a las operaciones de desplazamiento y reducción realizadas.


              Logros
---------------------------------

Scanner:

 - Es capaz de detectar todos los tokens especificados por la gramática del lenguaje ProAlg, ya sean palabras reservadas,
   identificadores, operadores aritméticos y booleanos, etcétera.

 - Es case insensitive, es decir, no diferencia entre mayúsculas y minúsculas.

 - Asocia a la variable 'YYLVAL' los valores necesarios para el correcto funcionamiento del parser.

Parser:

 - Recibe los tokens detectados por el scanner y realiza operaciones shift y reduce mientras reconoce las expresiones de
   la gram�tica. Es capaz de reconocer la estructura completa de cualquier algoritmo de ProAlg, diferenciando los distintos
   componentes y subcomponentes de dicha estructura.

 - Mediante la librer�a ts, reconoce la definición de variables en el algoritmo y las almacena en la tabla de s�mbolos.

 - Utiliza la librer�a tc para la construcción de código de tres direcciones, que es almacenado en la tabla de cu�druplas.

 - Dispone del 'YYSTYPE', un 'union' que puede contener literales, operadores aritméticos o booleanos, o estructuras de mayor complejidad.

 - Se han definido prioridades en los tokens y asociatividades en los operadores aritméticos para la resoluci�n de conflictos
   de desplazamiento y reducción. Finalmente, tenemos 12 conflictos shift-reduce y 6 conflictos reduce-reduce, que parecen resolverse
   correctamente al menos en los ejemplos utilizados durante el desarrollo del proyecto.

 Otras utilidades y comentarios:

 - Modelo Fortran: se ha realizado una peque�a variaci�n en la gramática especificada, debido a la necesidad de diferenciar las
                   expresiones aritm�ticas de las booleanas en el parser, de forma que las variables booleanas deben empezar por b o B.

 - Booleanos: Se ha realizado otra modificación en la gramática para llevar a cabo las expresiones booleanas debido a la necesidad de conocer en el _AND_ y en el _OR_ donde empieza el código de destino de saltos. Para ello hemos añadido la traducción `exp_b_m` en la que almacenamos la posición de la tabla de cuadruplas en la que se almacenara el valor de la expresión.
 - Tabla de cuadruplas: Hemos definido un operando nulo con el valor 24.

 Porcentaje de trabajo imputable
---------------------------------

 - Mikel Ardanaz: 60%
 - Jaime Elcarte: 40%
