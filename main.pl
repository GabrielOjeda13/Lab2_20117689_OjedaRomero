% Gabriel Ojeda
% 20.117.689-1
% Laboratorio 2 Prolog

%%FUNCIONES AUX
appendElement( Elemento, [], [Elemento]).
appendElement( Elemento, Lista [Elemento|Lista]).


%%--------------- VARIABLES GENERALES ---------------.

% VARIABLES IMAGE
%   Width: Corresponde al ancho de la imágen
%   Height: Corresponde al alto de la imágen
%   ListaPixels: Correspendo a una lista de elementos de cualquier tipo de pixel.

% VARIABLES PIXELS
%   X: Corresponde a la coordenada X de una pixbit
%   Y: Corresponde a la coordenada Y de una pixbit
%   Depth: Corresponde a la profundidad del pixel.
%%   Bit: Corresponde al valor que puede tomar un pixel tipo pixbit, 0 o 1.
%%   Hex: Corresponde al valor string en hexadecimal del PixelHex.
%%   R: Corresponde al primero valor del pixelRGB, R puede ser un numero del 0 al 255.
%%   G: Corresponde al segundo valor del pixelRGB, G puede ser un numero del 0 al 255.
%%   B: Corresponde al tecer valor del pixelRGB, B puede ser un numero del 0 al 255.


%Predicados.
%%--------------- CONSTRUCTORES ---------------.
%Constructor image.
image(Width, Height, ListaPixels,[Width, Height, ListaPixels]).

%Constructor Pixbit.
pixbit(X, Y, Bit, Depth,[X, Y, Bit, Depth]).

%Constructor Pixhex.
pixhex(X, Y, Hex, Depth,[X, Y, Hex, Depth]).

%Constructor PixRgb.
pixrgb(X, Y, R, G, B, Depth,[X, Y, R, G, B, Depth]).


%%--------------- SELECTORES ---------------.
%Selectorres image
getWidth([Width|_],Width).
getHeigth([_|[Height|_]],Height).
getListaPixels([_|[_|[ListaPixels|_]]],ListaPixels).

%Generales pixels
getX([X|_],X).
getY([_|[Y|_]],Y).

%Selectores PixBit.
getBit([_|[_|[Bit|_]]],Bit).
getDepthBit([_|[_|[_|[Depth|_]]]],Depth).

%Selectores PixHex.
getHex([_|[_|[Hex|_]]],Hex).
getDepthHex([_|[_|[_|[Depth|_]]]],Depth).

%Selectores PixRgb.
getR([_|[_|[R|_]]],R).
getG([_|[_|[_|[G|_]]]],G).
getB([_|[_|[_|[_|[B|_]]]]],B).
getDepthRgb([_|[_|[_|[_|[_|[Depth|_]]]]]],Depth).

%%--------------- PERTENENCIAS ---------------.
%Predicado isBitmap?
isBitmap(PixelBit):- getBit(PixelBit, Bit),
    				(Bit == 0 ; Bit == 1).
validePixelIsBitmap([]):- !.
validePixelIsBitmap([X|Y]):- isBitmap(X), validePixelIsBitmap(Y).

imagenIsBimap(Img):-
    getListaPixels(Img,ListaPixeles), validePixelIsBitmap(ListaPixeles).
    

%Predicado isHexmap?
isHexmap(PixelHex):- getHex(PixelHex, Hex),
    				string(Hex).
validePixelIsHexmap([]):- !.
validePixelIsHexmap([X|Y]):- isHexmap(X), validePixelIsHexmap(Y).

imagenIsHexmap(Img):-
    getListaPixels(Img,ListaPixeles), validePixelIsHexmap(ListaPixeles).

%Predicado isPixmap? (Pixel RGB).
isPixmap(PixelRgb):- getR(PixelRgb, R),
    				getG(PixelRgb, G),
    				getB(PixelRgb, B),
    				(R >= 0, R=< 255),
					(G >= 0, G=< 255),
					(B >= 0, B=< 255).
validePixelIsPixmap([]):- !.
validePixelIsPixmap([X|Y]):- isPixmap(X), validePixelIsPixmap(Y).

imageIsPixmap(Img):-
    getListaPixels(Img,ListaPixeles), validePixelIsPixmap(ListaPixeles).

%Predicado que da vuelta una imagen Horizontalmente

insertarAlPrincipio( Elemento, [], [Elemento] ).
insertarAlPrincipio( Elemento, Lista, [Elemento|Lista] ).

pixelRotateH(Pixel, Ancho, NewPixel):-
    getX(Pixel, X),
    getY(Pixel, Y),
    getBit(Pixel, Bit),
    getDepthBit(Pixel, D),
    (X < Ancho, NewX is X + 1; NewX is X - 1),
    pixbit(NewX, Y, Bit, D, NewPixel).

pixelsFlipH([], _, _):- !.
pixelsFlipH([Pixel|Cola], Ancho, NewListaPixels) :-
    pixelRotateH(Pixel, Ancho, NewPixel),
    insertarAlPrincipio(NewPixel, NewListaPixels, ListaPixels),
    pixelsFlipH(Cola, Ancho, ListaPixels).

imageFlipH(Img, NewImg) :-
    getListaPixels(Img, ListaPixeles),
    getWidth(Img, Ancho),
    getHeigth(Img, Alto),
    pixelsFlipH(ListaPixeles, Ancho, NewListPixels),
    image(Ancho, Alto, NewListPixels, NewImg).


/*
insertarAlPrincipio( Elemento, [], [Elemento] ).
insertarAlPrincipio( Elemento, Lista, [Elemento|Lista] ).

movePixelH(Ancho, Pixel, PixelOut) :-
    pixbitd(X, Y, Bit, Depth, Pixel),
    (  Y < Ancho
    -> NewY is Y + 1     
    ;  NewY is 0
    ),
    pixbitd(X, NewY, Bit, Depth, PixelOut).

movePixelsHorizontally(Ancho, [Pixel|Resto], PixelsAcc, PixelsOut) :-
    movePixelH(Ancho, Pixel, PixelOut),
    insertarAlPrincipio(PixelOut, PixelsAcc, PixelsOut),
    
    
moveH(ImageIn, ImageOut) :-
    image(Largo, Ancho, PixelsIn, ImageIn),
    movePixelsHorizontally(Ancho, PixelsIn, PixelsOut),
	image(Largo, Ancho, PixelsOut, ImageOut).

*/



