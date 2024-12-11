gramatica
  = nl rule (nl rule)* nl

rule
  = name ruleName? nl "=" _ choice "i"? nl (";")?

choice
  = concatenacion ( nl "/"  nl concatenacion)*
  / concatenacion

concatenacion
  = expression (_ expression)*

expression
  = "@"? tag? [$]* _ exp [*+?]?
  / punto
  / eoi

exp
  = name
  / string
  / group
  / rango

punto
  = "."

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
  = name _ ":" _

ruleName "Nombre de la regla"
  = _ "\"" name "\"" _

name "id"
  = [_a-z]i[_a-z0-9]i*

eoi "end of input"
  = "!."

_ "whitespace"
  =  (comentario/[ \t])*

nl "new line"
  = (comentario/[ \t\n\r])*

comentario "Comment"
  = "//" [^\n]* nl
  / "/*" (!"*/".)* "*/"