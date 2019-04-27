/* Scanner para un lenguaje estilo C llamado CESP
 * Autores :
 * 			- Leyva Bejarano Miguel Angel
 *          - Velasco A. Ernesto
 *          - Alonso Daniel
 */

/*************************************************
*****      Sección de Declaraciones          *****
**************************************************/

%{
  #include <stdio.h>
%}

%option yylineno
%option noyywrap

/***************************************************
****      Sección de Expresiones Regulares     *****
****************************************************
Realizado por: 
- Leyva Bejarano Miguel Angel
*/

/* Expresión Regular para las palabras reservadas en CESP*/
palabraReservada entero|flotante|doble|caracter|vacio|estructura|si|sino|caso|para|mientras|retorna|defecto|romper|cambiar|imprimir|verdadero|falso

/*Expresiones regulares para los numeros enteros, flotantes y doble presición */
digito [0-9]
entero {digito}+
flotante {entero}("."{entero})?((e|E)[+-]?{entero})?

/*Expresión Regular para los identificadores de CESP*/
caracter [a-zA-Z]
letra [a-zA-Z]
letra_ {letra}|("_")
id {letra_}({letra_}|{digito})*

/*Expresión Regular para los operadores en CESP*/
operador \^|\~|\*|\+|\-|\=\=|\=|\%|\/
/*Expresión Regular para los espacios, tabuladores y saltos de linea*/
espacio [ \n\t]+
/*Expresión Regular para los comentarios en CESP*/
comentario (\¡\*^(\*\¿)*\*\¿\n)

%%

{palabraReservada} {
	/*Imprime un token que representa a una palabra reservada CESP*/
	printf ("<PALABRA RESERVADA,%s>\n",yytext);
}

{entero} {
    /*Imprime un token que representa a un número entero */ 
	printf ("<ENTERO,%s>\n",yytext);
}

{flotante} { 
	/*Imprime un token que representa a un número flotante de CESP*/ 
	printf ("<FLOTANTE,%s>\n",yytext);
}

{operador} {
	/*Imprime un token que representa a un operador de CESP*/ 
	printf ("<OPERADOR,%s>\n",yytext);
}

{id} {
	/*Imprime un token que representa a un uidentificador en CESP*/ 
	printf ("<IDENTIFICADOR,%s>\n",yytext);
}

{comentario} { 
	/*Ingnora un comentario*/ 
	printf ("<comen,%s>\n",yytext);
}

{espacio} {
	/*Ignora los espacios,salto de linea y tabuladores en CESP*/ 
}    

. {
	/*Imprime un aviso correspondiente a un error léxico en  CESP*/ 
	printf("Se encontro un error lexico: linea %d\n", yylineno);
}    

%%


/****************************************************
****   Sección de Procedimientos Auxiliares     *****
****************************************************/

int main (){
	yylex();
    return 0;
}


