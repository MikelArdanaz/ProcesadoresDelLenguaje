algoritmo ejemplobool;
    ent n, m: entero;
    sal suma: entero;
{Prec: n= N AND m = M AND M >= N >0} var
        ba,bb,bc,bd:booleano;
    fvar
    ba:=verdadero;
    bb:=falso;
    bc:=ba y bb;
    bd:=ba o bb;
    bd:= no bc
{Post: n =N AND suma = SUMATORIO(i=1..N)(M sobre i)}
falgoritmo .
