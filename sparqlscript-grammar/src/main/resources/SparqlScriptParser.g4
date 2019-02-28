parser grammar SparqlScriptParser;

import Sparql11Parser;

script
    : (query | endpointDecl | prefixDecl | assignment | ifBlock | forBlock | string | functionCall)*
    ;

endpointDecl
    : 'ENDPOINT' IRI_REF
    ;

assignment
    : var (':=' | '=') ( query | string | var | placeholder | varMerge) ';'?
    ;

ifBlock
    : 'IF' brackettedExpression '{' script '}' ( 'ELSE' '{' script '}')?
    ;

forBlock
    : 'FOR' '(' var 'IN' var ')' '{' script '}'
    ;

placeholder
    : ('$' | '?') '{' (~('}'))* '}'
    ;

varMerge
    : var '+' var
    ;