% Gabriel Ojeda
% 20.117.689-1
% Laboratorio 2 Prolog

:-use_module(tdapixhex).
:-use_module(tdapixrgb).
:-use_module(predicadosbase).
:-use_module(tdaimagen).



%%--------------- TDA PIXBIT ---------------.

%%--------------- VARIABLES GENERALES ---------------.

%   X: Corresponde a la coordenada X de una pixbit.
%   Y: Corresponde a la coordenada Y de una pixbit.
%   Bit: Corresponde al valor que puede tomar un pixel tipo pixbit, 0 o 1.
%   Depth: Corresponde a la profundidad del pixel.


%Predicados.
%%--------------- CONSTRUCTOR ---------------.
pixbit(X, Y, Bit, Depth,[X, Y, Bit, Depth]).


%%--------------- SELECTORES ---------------.
getBit([_|[_|[Bit|_]]],Bit).
getDepthBit([_|[_|[_|[Depth|_]]]],Depth).

%%--------------- PERTENENCIA ---------------.
%Predicado isBitmap?
isBitmap(PixelBit):- getBit(PixelBit, Bit),
				(Bit == 0 ; Bit == 1).
validePixelIsBitmap([]):- !.
validePixelIsBitmap([X|Y]):- isBitmap(X), validePixelIsBitmap(Y).

%----- PREDICADOS NECESARIOS PARA OTROS PREDICADOS -----
pixelRotateHbit(Pixel, Ancho, NewPixel):-
    getX(Pixel, X),
    getY(Pixel, Y),
    getBit(Pixel, Bit),
    getDepthBit(Pixel, D),
    (X < Ancho-1, NewX is X + 1; NewX is X - 1),
    pixbit(NewX, Y, Bit, D, NewPixel).

%HECHO
pixelsFlipHBit([], _, []):- !.
pixelsFlipHBit([Pixel|Cola], Ancho, [NewPixel|Cola2]) :-
    pixelRotateHBit(Pixel, Ancho, NewPixel),
    pixelsFlipHBit(Cola,Ancho,Cola2).

%HECHO
pixelRotateVBit(Pixel, Alto, NewPixel):-
    getX(Pixel, X),
    getY(Pixel, Y),
    getBit(Pixel, Bit),
    getDepthBit(Pixel, D),
    (Y < Alto-1, NewY is Y + 1; NewY is Y - 1),
    pixbit(X, NewY, Bit, D, NewPixel).

%HECHO
pixelsFlipVBit([], _, []):- !.
pixelsFlipVBit([Pixel|Cola], Alto, [NewPixel|Cola2]) :-
    pixelRotateVBit(Pixel, Alto, NewPixel),
    pixelsFlipVBit(Cola,Alto,Cola2).
