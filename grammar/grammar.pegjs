gramatica
  = rule+ nl

rule
  = nl id nl string? nl "=" _ choice nl (_";"_)?

choice
  = concatenacion ( nl "/"  nl concatenacion)*

concatenacion
  = pluck (_ pluck)*

pluck
  = "@"? _ label

label
  = (id _":"_)? expression

expression
  = ("!" / "&")_ expression 
  / "$"? exp (_ quantifier _)?
  / punto
  / eoi

quantifier
  = [*+?]
  / "|" _ (int / id) _ "|"
  / "|" _ (int / id)? _ ".." _ (int / id)? _ "|"
  / "|" _ (int / id)? _ "," _ choice _ "|"
  / "|" _ (int / id)? _ ".." _ (int / id)? _ "," _ choice _ "|"

exp
  = id
  / string "i"?
  / group  
  / rango "i"?

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

id "identifier"
  = [_a-z]i[_a-z0-9]i*

eoi "end of input"
  = "!."

_ "whitespace"
  =  (comentario/[ \t])*

nl "new line"
  = (comentario/[ \t\n\r])*

int
  = [0-9]+

comentario
  = "//" [^\n]* nl
  / "/*" (!"*/".)* "*/"