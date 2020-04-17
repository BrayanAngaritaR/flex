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