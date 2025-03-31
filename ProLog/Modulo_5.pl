padre(tatara, bisa).
padre(bisa, abu).
padre(abu, padre).
padre(padre, hijo).

ancestro(Padre, Persona):-padre(Padre, Persona).
ancestro(Ancestro, Persona):-
    padre(Padre, Persona),
    ancestro(Ancestro, Padre).


distancia(buenosAires, puertoMadryn, 1300).
distancia(puertoMadryn, puertoDeseado, 732).
distancia(puertoDeseado, rioGallegos, 736).
distancia(puertoDeseado, calafate, 979).
distancia(rioGallegos, calafate, 304).
distancia(calafate, chalten, 213).

kilometrosViaje(Origen, Destino, Kms):-
distancia(Origen, Destino, Kms).
kilometrosViaje(Origen, Destino, KmsTotales):-
distancia(Origen, PuntoIntermedio, KmsIntermedios),
kilometrosViaje(PuntoIntermedio, Destino, KmsFinales),
KmsTotales is KmsIntermedios + KmsFinales.

totalViaje(Origen, Destino, Kms):-
kilometrosViaje(Origen, Destino, Kms).
totalViaje(Origen, Destino, Kms):-
kilometrosViaje(Destino, Origen, Kms).

#Predicado member/2

#Un elemento está en la lista
#● si está en la cabeza de la lista
#● si está en la cola.
#El chiste de esta denición es que como la cola es una lista, la denición del
#predicado member termina siendo recursiva:
# Caso base: El elemento es la cabeza de la lista.
mi_member(X, [X|_]).  

# Caso recursivo: El elemento no es la cabeza, pero puede estar en la cola.
mi_member(X, [_|Tail]) :-
    mi_member(X, Tail).


mi_member(5, [4, 3, 5, 6]):

#No hay coincidencia entre 5 y 4, entonces se llama recursivamente con [3, 5, 6].

mi_member(5, [3, 5, 6]):

#No hay coincidencia entre 5 y 3, entonces se llama recursivamente con [5, 6].

mi_member(5, [5, 6]):

#¡Aquí hay coincidencia! 5 es igual al primer elemento de la lista. Se unifican, y la consulta es exitosa.

#Predicado nth1/3

enesimo(1, [Elemento|_], Elemento).
    enesimo(Posicion, [_|Resto], Elemento):-
    enesimo(PosicionCola, Resto, Elemento),
    Posicion is PosicionCola + 1.   

padre(homero,bart).