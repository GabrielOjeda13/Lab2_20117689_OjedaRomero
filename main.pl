% Gabriel Ojeda
% 20.117.689-1
% Laboratorio 2 Prolog

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
getHexH([_|[_|[Hex|_]]],Hex).
getDepthHex([_|[_|[_|[Depth|_]]]],Depth).

%Selectores PixRgb.
getR([_|[_|[R|_]]],R).
getG([_|[_|[_|[G|_]]]],G).
getB([_|[_|[_|[_|[B|_]]]]],B).
getDepthRgb([_|[_|[_|[_|[_|[Depth|_]]]]]],Depth).



%Predicado isBitmap?
elementoEnLista([],_):- false, !.
elementoEnLista([_,_,X,_|Y],Elemento):- X = Elemento; elementoEnLista(Y,Elemento).
elementoEnLista2([]):- false, !.
elementoEnLista2([X|Y]):-
    elementoEnLista(X,0),
    elementoEnLista2(Y),
    elementoEnLista(X,1);
    elementoEnLista2(Y).



getobenListaPixels([[_,_,bit,_]|PixelRestante]):- 
    pixbit(_, _,bit,_,_),
    getobenListaPixels(PixelRestante).

imagenIsBimap(Img):-
    getListaPixels(Img,ListaPixeles), getobenListaPixels(ListaPixeles).