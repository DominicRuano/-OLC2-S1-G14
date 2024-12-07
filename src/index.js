import * as Parser from './grammar.js';
export default function parsear(entrada) {
    try {
        Parser.parse(entrada);
    }
    catch (e) {
        return e;
    }
    return "Compilación exitosa!";
}
