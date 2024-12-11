gramatica
  = nl rule (nl rule)* nl

rule
  = name ruleName? nl "=" _ choice nl ";"

choice
  = concatenacion ( nl "/"  nl concatenacion)*
  / concatenacion

concatenacion
  = expression (_ expression)*

expression
  = tag? [$]* _ exp [*+?]?

exp
  = name
  / string
  / group
  / rango

group 
  = "(" _ choice _ ")"

string
	= ["] [^"]* ["]
    / ['] [^']* [']

rango
  = "[" entrada_rango "]";

entrada_rango
  = (caracter "-" caracter
  / caracter)+

caracter
  = [a-zA-Z0-9] 
  / [^-\]]

tag "Etiqueta"
  = "@"? name _ ":" _

ruleName "Nombre de la regla"
  = _ "\"" name "\"" _

name "id"
  = [_a-z]i[_a-z0-9]i*

_ "whitespace"
  = [ \t]*

nl "nuevalinea"
  = [ \t\n\r]* 