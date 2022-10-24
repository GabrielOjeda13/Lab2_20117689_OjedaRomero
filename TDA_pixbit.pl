% Gabriel Ojeda
% 20.117.689-1
% Laboratorio 2 Prolog

% ---------- TDA PIXBIT ----------

%VARIABLES

%   X: Corresponde a la coordenada X de una pixbit
%   Y: Corresponde a la coordenada Y de una pixbit
%   Bit: Corresponde al valor que puede tomar un pixel tipo pixbit, 0 o 1.
%   Depth: Corresponde a la profundidad del pixel.

%Predicados.
%CONSTRUCTOR TDA Pixbit.
pixbit(X, Y, Bit, Depth,[X, Y, Bit, Depth]).

%SELECTORES TDA image
getX([X|_],X).
getY([_|[Y|_]],Y).
getBit([_|[_|[Bit|_]]],Bit).
getDepth([_|[_|[_|[Depth|_]]]],Depth).