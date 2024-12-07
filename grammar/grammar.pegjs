START
    = head:EXP tail:( NL EXP)* NL?
        {
            return "All good!";
        }

EXP "Expresion"
    = NL ID NL "=" NL ARGS NL ";"

ARGS "Arguments"
    = CONCAT ( NL "/" NL CONCAT)*

CONCAT "Concatenation"
    = LITERAL ( _ LITERAL)*

LITERAL "Literal"
    = _ ID
    / _ STRING

STRING "STRING"
	= ["] [^"]* ["]
    / ['] [^']* [']

ID "name"
    = [_a-z][_a-z0-9]i*

_ "whitespace"
    = [ \t]*

NL "newline"
    = [ \t\n\r]*