% Gabriel Ojeda
% 20.117.689-1
% Laboratorio 2 Prolog

% ---------- TDA PIXHEX ----------

%VARIABLES

%   X: Corresponde a la coordenada X de una pixHex
%   Y: Corresponde a la coordenada Y de una pixHex
%   Hex: Corresponde al valor string en hexadecimal.
%   Depth: Corresponde a la profundidad del pixel.

%Predicados.
%CONSTRUCTOR TDA Pixhex.
pixhex(X, Y, Hex, Depth,[X, Y, Hex, Depth]).

%SELECTORES TDA PixHex
getXH([X|_],X).
getYH([_|[Y|_]],Y).
getHexH([_|[_|[Hex|_]]],Hex).
getDepthH([_|[_|[_|[Depth|_]]]],Depth).