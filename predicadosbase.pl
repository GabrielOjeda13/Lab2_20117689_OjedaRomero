% Gabriel Ojeda
% 20.117.689-1
% Laboratorio 2 Prolog

%--------------- PREDICOS BASE PARA OTROS PREDICADOS ---------------.

%%--------------- SELECTORES ---------------.
%Generales pixels
getX([X|_],X).
getY([_|[Y|_]],Y).

%%--------------- AGREGAR ELEMENTO EN LISTA ---------------.
appendElement( Elemento, [], [Elemento]).
appendElement( Elemento, Lista, [Elemento|Lista]).

