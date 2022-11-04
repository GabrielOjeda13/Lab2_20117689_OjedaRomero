% Gabriel Ojeda
% 20.117.689-1
% Laboratorio 2 Prolog

:-use_module(tdapixbit).
:-use_module(tdapixrgb).
:-use_module(predicadosbase).
:-use_module(tdaimagen).



%%--------------- TDA PIXBHEX ---------------.

%%--------------- VARIABLES GENERALES ---------------.

%   X: Corresponde a la coordenada X de una pixhex.
%   Y: Corresponde a la coordenada Y de una pixhex.
%   Hex: Corresponde al valor string en hexadecimal del PixelHex.
%   Depth: Corresponde a la profundidad del pixel.

%%--------------- CONSTRUCTOR ---------------.
pixhex(X, Y, Hex, Depth,[X, Y, Hex, Depth]).


%%--------------- SELECTORES ---------------.
getHex([_|[_|[Hex|_]]],Hex).
getDepthHex([_|[_|[_|[Depth|_]]]],Depth).


%%--------------- PERTENENCIAS ---------------.
%Predicado isHexmap?
isHexmap(PixelHex):- getHex(PixelHex, Hex),
				string(Hex).
validePixelIsHexmap([]):- !.
validePixelIsHexmap([X|Y]):- isHexmap(X), validePixelIsHexmap(Y).


%----- PREDICADOS NECESARIOS PARA OTROS PREDICADOS -----
pixelRotateHhex(Pixel, Ancho, NewPixel):-
    getX(Pixel, X),
    getY(Pixel, Y),
    getHex(Pixel, Hex),
    getDepthHex(Pixel, D),
    (X < Ancho-1, NewX is X + 1; NewX is X - 1),
    pixhex(NewX, Y, Hex, D, NewPixel).

%HECHO
pixelsFlipHHex([], _, []):- !.
pixelsFlipHHex([Pixel|Cola], Ancho, [NewPixel|Cola2]) :-
    pixelRotateHHex(Pixel, Ancho, NewPixel),
    pixelsFlipHHex(Cola,Ancho,Cola2).

%HECHO
pixelRotateVHex(Pixel, Alto, NewPixel):-
    getX(Pixel, X),
    getY(Pixel, Y),
    getHex(Pixel, Hex),
    getDepthHex(Pixel, D),
    (Y < Alto-1, NewY is Y + 1; NewY is Y - 1),
    pixhex(X, NewY, Hex, D, NewPixel).

%HECHO
pixelsFlipVHex([], _, []):- !.
pixelsFlipVHex([Pixel|Cola], Alto, [NewPixel|Cola2]) :-
    pixelRotateVHex(Pixel, Alto, NewPixel),
    pixelsFlipVHex(Cola,Alto,Cola2).
