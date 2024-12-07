START
    = head:EXP tail:( NL EXP)* NL?
        {
            return "All good!";
        }

EXP "Expresion"
    = NL ID NL "=" NL ARGS NL ";"

ARGS "Arguments"
    = CONCAT ( NL "/" NL CONCAT)* 
    / QUESTION

CONCAT "Concatenation"
    = LITERAL ( _ LITERAL)*

VARIABLE "Variable"
    = INTEGER
    / STRING
    / ID

LITERAL "Literal"
    = _ ID
    / _ STRING

STRING "STRING"
	= ["] [^"]* ["]
    / ['] [^']* [']
    
INTEGER "INTEGER"
    = [0-9]*   

ID "name"
    = [_a-z][_a-z0-9]i*

_ "whitespace"
    = [ \t]*

NL "newline"
    = [ \t\n\r]*

QUESTION "Question"
    = 