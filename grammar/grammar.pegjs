gramatica
  = rule+ _

rule
  = _ id _ string? _ "=" _ choice  (_";")? 

choice
  = concatenacion (_ "/" _ concatenacion)*

concatenacion
  = pluck (_ pluck !(_ string? _ "="))*

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
  = "[" entrada_rango "]"

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
  = (comentario / [ \t\r\n])*

int
  = [0-9]+

comentario
  = "//" [^\n]* _
  / "/*" (!"*/".)* "*/"