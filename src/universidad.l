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