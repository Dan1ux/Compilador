/* Scanner para un lenguaje estilo C llamaado CESP*/

/*************************************************
*****      Sección de Declaraciones          *****
**************************************************/

%{
  #include <stdio.h>
  #include <stdlib.h>
%}


/***************************************************
****      Sección de Expresiones Regulares     *****
****************************************************/
programa {declaraciones}{funciones}
declaraciones {tipo}{lista}(";")|("")
tipo entero|flotante|doble|caracter|vacio|{estructura}("{"){declaraciones}("}") 
lista {lista}(","){id}{arreglo}|{id}{arreglo}
arreglo ("["){numero}("]"){arreglo}|""
funciones {tipo}{id}("("){argumento}(")")("{"){declaraciones}{sentencias}("}"){funciones}|""
argumento {listas_argumentos}|""
lista_argumentos lista_argumentos(","){tipo}{id}{parte_arreglo}|{tipo}{id}{parte_arreglo}
parte_arreglo ("[")("]"){parte_arreglo}|""
sentencia {sentencia}{sentencia}|("si")("("){condicion}(")")(";")|("para")("("){sentencia}(";"){condición}(";"){sentencia}(")"){sentencia}|("mientras")("("){parte_izq}("="){expresion}(";")|("regreso"){expresion}(";")|("regreso")(";")|("{"){sentencia}("}")|("cambiar")("("){expresion}(")")("{"){casos}{predeterminado}("}")|("romper")(";")|("imprimir"){expresion}(";")
casos ("caso")(":"){numero}{sentencia}{predeterminado}|""
predeterminado ("defecto")(":"){sentencia}|""
parte_izq {id}|{var_arreglo}|{id}("."){id}
var_arreglo {id}("["){expresion}("]")|{var_arreglo}("["){expresion}("]")
expresion {expresion}("+"){expresion}|{expresion}("-"){expresion}|{expresion}("*"){expresion}|{expresion}("/"){expresion}|{expresion}("%"){expresion}|{var_arreglo}|{cadena}|{numero}|{caracter}|{id}("("){parametros}(")")
parametros {lista_param}|""
lista_param {lista_param}(","){expresion}|{expresion}
condicion {condicion}("o"){condicion}|{condicion}("y"){condicion}|("negar"){condicion}|("("){condicion}(")")|{expresion}{relacional}{expresion}|("cierto")|("falso")
relacional ("<")|(">")|(">=")|("<=")|("!=")|("==")
numero [0-9]
caracter [a-zA-Z]
letra_ {caracter}|("_")
espacio [ \t\n]
esps {espacio}+
cadena {caracter}{caracter}+
id {letra_}({letra_}|{numero})+

%%


/***************************************************
****   Sección de Procedimientos Auxiliares     *****
****************************************************/


%%

int main (){
    yylex();
}


