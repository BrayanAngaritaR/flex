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