import { readFileSync } from 'node:fs';
import * as Parser from './grammar.js';

const data = readFileSync("./src/input.txt", { encoding: 'utf-8' });

try {
    const output = Parser.parse(data.trim());
    console.log(output);
} catch (e) {
    console.error(
        e.name + ": At Line " + e.location.start.line + 
        ", Column " + e.location.start.column + ".\n\t" + e.message +
        "\n\tFound: " + (e.found === null ? "end of input" : '"' + e.found + '"')
    );
    
}

