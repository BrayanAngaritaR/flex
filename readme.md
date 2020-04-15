##Direcciones

<p align="center">
	<img src="https://github.com/BrayanAngaritaR/flex/blob/master/images/direcciones.png">
</p>

Este ejercicio está planteado con el sistema de matrículas del siguiente enlace.

- [Sistema de Matrículas](https://www.sistemamatriculas.gov.co/ayuda/direccciones.pdf).

Expresión regular:

```
(AU|AV|AC|AK|BL|CL|KR|CT|CQ|CV|CC|DG|PJ|PS|PT|TV|TC|VT|VI|)+([ ])+([0-9]{1}|[0-9]{2}|[0-9]{3})+([ ]|[A-Z])+(#)+([ ])+([0-9]{1}|[0-9]{2}|[0-9]{3})+(-)+([0-9]{1}|[0-9]{2}|[0-9]{3})+
```
Análisis:

```
(AU|AV|AC|AK|BL|CL|KR|CT|CQ|CV|CC|DG|PJ|PS|PT|TV|TC|VT|VI|)
([ ])
([0-9]{1}|[0-9]{2}|[0-9]{3})
([ ]|[A-Z])
(#)
([ ])
([0-9]{1}|[0-9]{2}|[0-9]{3})
(-)
([0-9]{1}|[0-9]{2}|[0-9]{3})


TIPODIRECCION 	= 	TD
BLANCO			=	BLANCO
PRIMEROSNUMEROS =	PN
ESPACIO_O_LETRA =	EOL
SIMBOLONUMERO 	=	SN
SEGUNDOSNUMEROS =	SEGN
GUION 			=	GUION
ULTIMOSNUMEROS 	=	ULTN

//Determinar la dirección: 

{TIPODIRECCION}{BLANCO}{PRIMEROSNUMEROS}{ESPACIO_O_LETRA}{SIMBOLONUMERO}{BLANCO}{SEGUNDOSNUMEROS}{GUION}{ULTIMOSNUMEROS}

//Abreviado

{TD}{BLANCO}{PN}{EOL}{SN}{BLANCO}{SEGN}{GUION}{ULTN}
```

###Código de Flex - Direcciones

```
%{
	#include <stdio.h>
%}

TD	("AU"|"AV"|"AC"|"AK"|"BL"|"CL"|"KR"|"CT"|"CQ"|"CV"|"CC"|"DG"|"PJ"|"PS"|"PT"|"TV"|"TC"|"VT"|"VI") 
BLANCO	(" ")
PN	([0-9]{1}|[0-9]{2}|[0-9]{3}) 
EOL	(" "|[A-Z]) 
SN	([#]) 
SEGN	([0-9]{1}|[0-9]{2}|[0-9]{3}) 
GUION	([-])
ULTN	([0-9]{1}|[0-9]{2}|[0-9]{3}) 
VALORNOVALIDO    [ 0-9a-zA-Z]+

%%

{TD}{BLANCO}{PN}{EOL}{SN}{BLANCO}{SEGN}{GUION}{ULTN}	printf( "La direccion ingresa es valida. Ingresaste: %s\n", yytext );


{VALORNOVALIDO}	printf( "No se reconoce el valor ingresado: %s\n", yytext );

.	printf( "No se reconoce el simbolo ingresado: %s\n", yytext );

%%

int main()
{
	yylex();
}
```