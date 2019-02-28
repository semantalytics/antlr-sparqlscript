grammar SparqlScript;

Script
    : (Query | EndpointDecl | PrefixDecl | Assignment | IFBlock | FORBlock | String | FunctionCall)*
    ;

EndpointDecl
    : 'ENDPOINT' IRI_REF
    ;

Assignment
    : Var (':=' | '=') ( Query | String | Var | Placeholder | VarMerge) ';'?
    ;

IFBlock
    : 'IF' BrackettedExpression '{' Script '}' ( 'ELSE' '{' Script '}')?
    ;

FORBlock
    : 'FOR' '(' Var 'IN' Var ')' '{' Script '}'
    ;

Placeholder
    : ('$' | '?') '{' [^}]* '}'
    ;

VarMerge
    : Var '+' Var
    ;