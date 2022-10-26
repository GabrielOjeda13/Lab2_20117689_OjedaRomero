% Gabriel Ojeda
% 20.117.689-1
% Laboratorio 2 Prolog

% ---------- TDA PIXRGB ----------

%VARIABLES

%   X: Corresponde a la coordenada X de una pixRgb
%   Y: Corresponde a la coordenada Y de una pixRgb
%   R: Corresponde al primero valor del pixelRGB, R puede ser un numero del 0 al 255.
%   G: Corresponde al segundo valor del pixelRGB, G puede ser un numero del 0 al 255.
%   B: Corresponde al tecer valor del pixelRGB, B puede ser un numero del 0 al 255.
%   Depth: Corresponde a la profundidad del pixel.

%Predicados.
%CONSTRUCTOR TDA PixRgb.
pixrgb(X, Y, R, G, B, Depth,[X, Y, R, G, B, Depth]).

%SELECTORES TDA PixRgb
getXR([X|_],X).
getYR([_|[Y|_]],Y).
getR([_|[_|[R|_]]],R).
getG([_|[_|[_|[G|_]]]],G).
getB([_|[_|[_|[_|[B|_]]]]],B).
getDepthR([_|[_|[_|[_|[_|[Depth|_]]]]]],Depth).
