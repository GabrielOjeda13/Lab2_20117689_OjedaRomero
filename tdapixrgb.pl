% Gabriel Ojeda
% 20.117.689-1
% Laboratorio 2 Prolog

:-use_module(tdapixbit).
:-use_module(tdapixhex).
:-use_module(predicadosbase).
:-use_module(tdaimagen).


%--------------- TDA PIXRGB ---------------.

%%--------------- VARIABLES GENERALES ---------------.

% VARIABLES PIXELS
%   X: Corresponde a la coordenada X de una pixrgb.
%   Y: Corresponde a la coordenada Y de una pixrgb.
%   R: Corresponde al primero valor del pixelRGB, R puede ser un numero del 0 al 255.
%   G: Corresponde al segundo valor del pixelRGB, G puede ser un numero del 0 al 255.
%   B: Corresponde al tecer valor del pixelRGB, B puede ser un numero del 0 al 255.
%   Depth: Corresponde a la profundidad del pixel.


%Predicados.
%%--------------- CONSTRUCTOR ---------------.
pixrgb(X, Y, R, G, B, Depth,[X, Y, R, G, B, Depth]).


%%--------------- SELECTORES ---------------.
getR([_|[_|[R|_]]],R).
getG([_|[_|[_|[G|_]]]],G).
getB([_|[_|[_|[_|[B|_]]]]],B).
getDepthRgb([_|[_|[_|[_|[_|[Depth|_]]]]]],Depth).

%%--------------- PERTENENCIAS ---------------.
%Predicado isPixmap? (Pixel RGB).
isPixmap(PixelRgb):- getR(PixelRgb, R),
				getG(PixelRgb, G),
				getB(PixelRgb, B),
				(R >= 0, R=< 255),
					(G >= 0, G=< 255),
					(B >= 0, B=< 255).
validePixelIsPixmap([]):- !.
validePixelIsPixmap([X|Y]):- isPixmap(X), validePixelIsPixmap(Y).


%----- PREDICADOS NECESARIOS PARA OTROS PREDICADOS -----
pixelRotateHRgb(Pixel, Ancho, NewPixel):-
    getX(Pixel, X),
    getY(Pixel, Y),
    getR(Pixel, R),
    getG(Pixel, G),
    getB(Pixel, B),
    getDepthRgb(Pixel, D),
    (X < Ancho-1, NewX is X + 1; NewX is X - 1),
    pixrgb(NewX, Y, R, G, B, D, NewPixel).

%HECHO
pixelsFlipHRgb([], _, []):- !.
pixelsFlipHRgb([Pixel|Cola], Ancho, [NewPixel|Cola2]) :-
    pixelRotateHRgb(Pixel, Ancho, NewPixel),
    pixelsFlipHRgb(Cola,Ancho,Cola2).

%HECHO
pixelRotateVRgb(Pixel, Alto, NewPixel):-
    getX(Pixel, X),
    getY(Pixel, Y),
    getR(Pixel, R),
    getG(Pixel, G),
    getB(Pixel, B),
    getDepthRgb(Pixel, D),
    (Y < Alto-1, NewY is Y + 1; NewY is Y - 1),
    pixrgb(X, NewY, R, G, B, D, NewPixel).

%HECHO
pixelsFlipHVRgb([], _, []):- !.
pixelsFlipHVRgb([Pixel|Cola], Alto, [NewPixel|Cola2]) :-
    pixelRotateVRgb(Pixel, Alto, NewPixel),
    pixelsFlipHVRgb(Cola,Alto,Cola2).
