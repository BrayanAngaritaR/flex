## Direcciones

<p align="center">
	<img src="https://github.com/BrayanAngaritaR/flex/blob/master/images/direcciones.png">
</p>

Código ejecutado y compilado en Flex:

<p align="center">
	<img src="https://github.com/BrayanAngaritaR/flex/blob/master/images/direcciones-flex.png">
</p>

### Código de Flex - Direcciones

```
%{
	#include<stdio.h>
%}

UBICACION       [A-Z]*[a-z]*
NUMERO          [0-9]+
SIGNO           [#|∫]
GUION           ([-])
ESPACIO         [ ]
DIRECCION       ({UBICACION}{ESPACIO}{NUMERO}?{UBICACION}?{ESPACIO}{UBICACION}?{ESPACIO}?{SIGNO}{ESPACIO}{NUMERO}{UBICACION}?{ESPACIO}?{GUION}?{NUMERO})
DIRECCION2      ({UBICACION}{ESPACIO}?{NUMERO}{ESPACIO}{UBICACION}{ESPACIO}{UBICACION}{ESPACIO}{UBICACION})

%%

{UBICACION}     {       printf("Ha ingresado una ubicacion.\n");}
{NUMERO}        {       printf("Ha ingresado un numero.\n");}
{ESPACIO}       {       printf("Ha ingresado un espacio.\n");}
{SIGNO}         {       printf("Ha ingresado un signo.\n");}
{GUION}         {       printf("Ha ingresado un guion.\n");}
{DIRECCION}     {       printf("Ha ingresado una direccion.\n");}
{DIRECCION2}    {       printf("Ha ingresado una direccion.\n");}

%%

int main()
{
	printf("Desarrollado por Brayan Angarita \n");
	printf("Digita una direction: ");
	yylex();
}
```
___________________________

## Código del carnet de la Universidad

<p align="center">
	<img src="https://github.com/BrayanAngaritaR/flex/blob/master/images/universidad.png">
</p>

Este ejercicio tiene en cuenta los siguientes elementos.

- 2019: Año de matrícula 
- 1 ó 2: Semestre en que se matriculó 
- 0 Tipo de matrícula: Por defecto es 0 
- 070 Posición en que se matriculó el estudiante 
- 302 Código de la carrera 

Código ejecutado y compilado en Flex:

<p align="center">
	<img src="https://github.com/BrayanAngaritaR/flex/blob/master/images/universidad-flex.png">
</p>


### Código de Flex - Códigos de la universidad

```
%{
	#include <stdio.h>
%}

ANIO            ("196"|"197"|"198"|"199"|"200"|"201"|"202"+)([0-9]{1}) 
SEMESTRE        ([1|2]) 
TIPO            ([0-9]{1}) 
POSICION        ([0-9]{3}) 
CODIGOCARRERA   ([0-9]{3}) 
NORECONOCIDO    [ 0-9a-zA-Z]+ 

%% 


{ANIO}{SEMESTRE}{TIPO}{POSICION}{CODIGOCARRERA} printf( "Eres estudiante de UNAULA. El carnet digitado es: %s\n", yytext ); 

{NORECONOCIDO} printf( "Valor no reconocido: %s\n", yytext ); 

. printf( "Simbolo no reconocido: %s\n", yytext ); 

%% 

int main()
{
	printf("Desarrollado por Brayan Angarita \n");
	printf("Digita el numero de tu documento: ");
	yylex(); 
} 
```
___________________________

## Nombres y apellidos

<p align="center">
	<img src="https://github.com/BrayanAngaritaR/flex/blob/master/images/nombresyapellidos.png">
</p>

Código ejecutado y compilado en Flex:

<p align="center">
	<img src="https://github.com/BrayanAngaritaR/flex/blob/master/images/nombresyapellidos-flex.png">
</p>

### Código de Flex - Nombres y apellidos

```
%{
        #include<stdio.h>
%}

NOMYAPEL                ([A-Z]*[a-z]*)
ESPACIO                 [ ]
NOMBRECOMPLETO          ({NOMYAPEL}{ESPACIO}{NOMYAPEL}{ESPACIO}?{NOMYAPEL}?{ESPACIO}?{NOMYAPEL}?)

%%

{NOMYAPEL}              {       printf("Ha ingresado un nombre o un apellido.\n");}
{ESPACIO}               {       printf("Ha ingresado un espacio.\n");}
{NOMBRECOMPLETO}        {       printf("Ha ingresado un nombre completo.\n");}


%%

int main()
{
	printf("Desarrollado por Brayan Angarita \n");
	printf("Digita un nombre: ");
	yylex();
}
```
___________________________

## Operaciones

<p align="center">
	<img src="https://github.com/BrayanAngaritaR/flex/blob/master/images/operaciones.png">
</p>

Código ejecutado y compilado en Flex:

<p align="center">
	<img src="https://github.com/BrayanAngaritaR/flex/blob/master/images/operaciones-flex.png">
</p>

### Código de Flex - Operaciones

```
%{
        #include<stdio.h>
%}

NUMERO          [0-9]+
OPERACION       ["("|")"|"+"|"/"|"^"|"*"|"sqrt"|"!"]+
MENOS           ([-])
OPERACIONES     ({NUMERO}?{OPERACION}*{MENOS}?{NUMERO}*)+

%%

{NUMERO}        {       printf("Ha ingresado un numero.\n");}
{OPERACION}     {       printf("Ha ingresado un operador.\n");}
{MENOS}         {       printf("Ha ingresado el signo -.\n");}
{OPERACIONES}   {       printf("Ha realizado una operacion.\n");}
.               {       printf("Ha ingresado un caracter no reconocido.\n");}

%%

int main()
{
	printf("Desarrollado por Brayan Angarita \n");
	printf("Digita una operacion: ");
        yylex();
}
```
___________________________

## Número de teléfono

<p align="center">
	<img src="https://github.com/BrayanAngaritaR/flex/blob/master/images/fijoocelular.png">
</p>

Código ejecutado y compilado en Flex:

<p align="center">
	<img src="https://github.com/BrayanAngaritaR/flex/blob/master/images/fijoocelular-flex.png">
</p>

### Código de Flex - Número de teléfono

```
%{
        #include<stdio.h>
%}

MAS                     [+]
IDENTIFICADORNAC        [0|3]{2}
IDENTIFICADORINT        [5|7]{2}
CODCIUDAD               [1-8]{1}
CELULAR                 [3][0-9]{9}
FIJO                    [1-9]{7}
NUMEROCELDESDEFIJO      ({IDENTIFICADORNAC}{CELULAR})
NUMEROFIJODESDECEL      ({IDENTIFICADORNAC}{CODCIUDAD}{FIJO})
NUMEROFIJODESDEEXT      ({MAS}{IDENTIFICADORINT}{CODCIUDAD}{FIJO})
NUMEROCELDESDEEXT       ({MAS}{IDENTIFICADORINT}{CELULAR})

%%

{CELULAR}               {       printf("Ha ingresado un numero celular.\n");}
{FIJO}                  {       printf("Ha ingresado un numero fijo.\n");}
{NUMEROCELDESDEFIJO}    {       printf("Ha ingresado un numero celular marcado desde un fijo.\n");}
{NUMEROFIJODESDECEL}    {       printf("Ha ingresado un numero fijo marcado desde un celular.\n");}
{NUMEROFIJODESDEEXT}    {       printf("Ha ingresado un numero fijo marcado desde el exterior.\n");}
{NUMEROCELDESDEEXT}     {       printf("Ha ingresado un numero celular marcado desde el exterior.\n");}

%%

int main()
{
	printf("Desarrollado por Brayan Angarita \n");
	printf("Digita un numero de telefono o celular: ");
        yylex();
}
```
___________________________

## Este código ha sido realizado en Colaboración con Daniela Benjumea
