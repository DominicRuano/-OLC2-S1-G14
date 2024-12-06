Start
    = head:Exp tail:( NL Exp)* 
        {
            return "All good!";
        }

Exp "Tk_Expresion"
    = _ Id _ "=" _ Literal _ ";"?

Literal "Tk_Literal"
    = "\"" [_a-zA-Z0-9]*  "\""
    / "\'" [_a-zA-Z0-9]*  "\'"

Id "Tk_Id"
    = _ [_a-z][_a-z0-9]*

_ "Tk_whitespace"
    = [ \t]*

NL "Tk_newline"
    = [\n\r]*