/* Scanner para un lenguaje estilo C llamaado CESP*/

/*************************************************
*****      Sección de Declaraciones          *****
**************************************************/

%{
  #include <stdio.h>
  #include <stdlib.h>
%}

%option yylineno
%option noyywrap

/***************************************************
****      Sección de Expresiones Regulares     *****
****************************************************
Const
*/


palabraReservada entero|flotante|doble|caracter|vacio|estructura|si|sino|caso|para|mientras|retorna|defecto|romper|cambiar|imprimir|verdadero|falso
digito [0-9]
entero {digito}+
flotante {entero}("."{entero})?((e|E)[+-]?{entero})?
letra [a-zA-Z]
caracter [a-zA-Z@]
letra_ {letra}|("_")
espacio {[ \t\n]}*
cadena {caracter}+
id {letra_}({letra_}|{numero})+
comentario (\¡\*^(\*\¿)*\*\¿\n)

%%

{palabraReservada} {
	printf ("<PALABRA RESERVADA,%s>\n",yytext);
}

{entero} { 
	printf ("<ENTERO,%s>\n",yytext);
}

{flotante} { 
	printf ("<FLOTANTE,%s>\n",yytext);
}


comentario { printf ("<comen,%s>\n",yytext);}

[ \n\t]+ {}        

%%


/***************************************************
****   Sección de Procedimientos Auxiliares     *****
****************************************************/


int main (){
	yylex();

    return 0;
}


