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