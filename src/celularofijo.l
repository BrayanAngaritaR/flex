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