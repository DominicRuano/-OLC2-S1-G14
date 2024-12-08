import * as Parser from './grammar.js';

export default function parsear(entrada: string){
    try{
        Parser.parse(entrada)
    }catch(e){
        return (
            e.name + ": At Line " + e.location.start.line + 
            ", Column " + e.location.start.column + ".\n\t" + e.message +
            "\n\tFound: " + (e.found === null ? "end of input" : '"' + e.found + '"')
        );
    }
    return "Compilación exitosa!"
}

