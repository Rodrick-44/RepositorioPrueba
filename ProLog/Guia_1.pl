puedeAndar(comercioExterior,P):- habla(ingles,P), habla(frances,P), profesional(P).
puedeAndar(comercioExterior,P):- ambicioso(P).
puedeAndar(contaduria,P):- contador(P), honesto(P).
puedeAndar(ventas,P):- ambicioso(P), conExperiencia(P).
puedeAndar(ventas,lucia).

profesional(P):- contador(P).
profesional(P):- abogado(P).
profesional(P):- ingeniero(P).
ambicioso(P):- contador(P), joven(P).
conExperiencia(P):- trabajoEn(P,_).

contador(roque).
joven(roque).
trabajoEn(roque,acme).
habla(roque,frances).
honesto(roque).
ingeniero(ana).
habla(ana,ingles).
habla(ana,frances).
trabajoEn(ana,omni).

habla(lucia,ingles).
habla(lucia,frances).
trabajoEn(lucia,omni).
abogado(cecilia).
ambicioso(cecilia).
habla(cecilia,frances).