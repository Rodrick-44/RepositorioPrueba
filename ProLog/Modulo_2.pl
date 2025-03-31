come(juan, ravioles).
come(melina, ravioles).
come(brenda, fideos).
come(juan, fideos).

mortal(Persona):-humano(Persona).
humano(socrates).
humano(platon).

viveEn(tefi, lanus).
viveEn(gise, lanus).
viveEn(alf, lanus).
viveEn(dodain, liniers).
docente(alf).
docente(tefi).
docente(gise).
docente(dodain).

#AND (CONJUNCION)
afortunado(Persona):-docente(Persona), viveEn(Persona, lanus).

#OR (DIYUSION)
afortunado(Persona):-docente(Persona).
afortunado(Persona):-viveEn(Persona, lanus).

gusta(juan, maria).
gusta(perdro, ana).
gusta(pedro, nora).
gusta(Persona, zulema):-gusta(Persona, nora).
gusta(julian, Persona):-chica(Persona), morocha(Persona).
gusta(julian, Persona):-chica(Persona), tieneOnda(Persona).
gusta(mario, Persona):-chica(Persona), morocha(Persona), tieneOnda(Persona).
gusta(mario, luisa).
gusta(Persona, laura):-gusta(Persona, ana), gusta(Persona,luisa).

progenitor(homero, bart).
progenitor(homero, lisa).
progenitor(homero, maggie).
progenitor(abe, homero).
progenitor(abe, jose).
progenitor(jose, pepe).
progenitor(mona, homero).
progenitor(jacqueline, marge).
progenitor(marge, bart).
progenitor(marge, lisa).
progenitor(marge, maggie).

hermano(Hermano1, Hermano2):-progenitor(Padre, Hermano1), progenitor(Padre, Hermano2), Hermano1 \= Hermano2.

tio(Sobrino, Tio):-progenitor(Padre,Sobrino), hermano(Padre, Tio).

primo(Primo1, Primo2):-tio(Primo1, Padre), progenitor(Padre, Primo2).

abuelo(Abuelo, Nieto):-progenitor(Abuelo, Padre), progenitor(Padre, Nieto).