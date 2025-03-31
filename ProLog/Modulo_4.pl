#predicado de orden superior

# Predicado not/1

juega(julia, 3).
juega(beto, 6).
juega(dodain, 5).
juega(juana, 15).
juega(sergio, 3).

yeta(Numero):-not(juega(_, Numero)).

#Inversibilidad
#Tenemos que hacerle saber al motor el universo de números de la ruleta, a traves de un predicado generador

numeroRuleta(Numero):- between(1, 36, Numero).

yeta(Numero):-numeroRuleta(Numero), not(juega(_, Numero)).

#Not es de aridad 1, si nuestra intención es negar la ocurrencia de dos predicados:

not((10 > 3, juega(dodain, 5))).

#Predicado forall/2 
#forall(Condición, Acción).
#Queremos vericar que una condición se cumpla para todas las variables posibles
#Para cada posible solución de Condición, verifica que Acción sea verdadera.

materia(algoritmos, 1).
materia(analisisI, 1).
materia(pdp, 2).
materia(proba, 2).
materia(sintaxis, 2).
nota(nicolas, pdp, 10).
nota(nicolas, proba, 7).
nota(nicolas, sintaxis, 8).
nota(malena, pdp, 6).
nota(malena, proba, 2).
nota(raul, pdp, 9).

#“Un alumno terminó un año si aprobó todas las materias de ese año”
terminoAnio(Alumno, Anio):-
    forall(materia(Materia, Anio),
    (nota(Alumno, Materia, Nota), Nota >= 6)).

#Mas limpio

terminoAnio(Alumno, Anio):-
    forall(materia(Materia, Anio), aprobo(Alumno, Materia)).
    aprobo(Alumno, Materia):-nota(Alumno, Materia, Nota), Nota >= 6.

#Ejemplo Consultas
#terminoAnio(nicolas, 2).
#true

#inversibilidad
#El alumno no debe ser incógnita al momento de usar el forall:

terminoAnio(Alumno, Anio):-
    alumno(Alumno),
    forall(materia(Materia, Anio), aprobo(Alumno, Materia)).

alumno(Alumno):-nota(Alumno, _ , _).

#Ejemplo consulta:
#terminoAnio(Alumno, 2).
#Alumno = nicolas ;


#Predicado generador anio();
terminoAnio(Alumno, Anio):-
    alumno(Alumno),
    anio(Anio),
    forall(materia(Materia, Anio), aprobo(Alumno, Materia)).

#?- terminoAnio(nicolas, 5).
#False.

#Predicado Findall/3
#findall(UnIndividuoOVariable, Consulta, Conjunto)
#Si tenemos una forma de obtener múltiples respuestas a una consulta y lo que
#queremos es que todas esas respuestas estén juntas en una lista



padre(homero,bart).
padre(homero,maggie).
padre(homero,lisa).
padre(juan, fede).
padre(nico, julieta).

persona(Papa) :- padre(Papa, _).
persona(Hijo) :- padre(_, Hijo).

cantidadDeHijos(Padre, Cantidad) :- 
    findall(Hijo, padre(Padre, Hijo), Hijos),
    length(Hijos, Cantidad).

#nversibilidad 

cantidadDeHijos(Padre, Cantidad) :-
    persona(Padre), 
    findall(Hijo, padre(Padre, Hijo), Hijos),
    length(Hijos, Cantidad).

#En el segundo parámetro del ndall se puede denir cualquier tipo de consulta,
#no es necesario involucrar un único predicado.
#findall(X,(p(X),q(X),r(X),...,s(X)), Xs)

#ntersección de conjunto
#interseccion(Xs,Ys,Zs) :-
#findall(E,(member(E,Xs),member(E,Ys)),Zs).

