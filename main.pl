% Gabriel Ojeda
% 20.117.689-1
% Laboratorio 2 Prolog

%%FUNCIONES AUX
appendElement( Elemento, [], [Elemento]).
appendElement( Elemento, Lista, [Elemento|Lista]).


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

%-------- PREDICADO QUE DA VUELTA UNA IMAGEN HORIZONTALMENTE --------.

%----- PIXBIT -----
pixelRotateHBit(Pixel, Ancho, NewPixel):-
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


%----- PIXHEX -----
pixelRotateHHex(Pixel, Ancho, NewPixel):-
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

%----- PIXRGB -----
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

imageFlipH(Img, NewImg) :-
    getListaPixels(Img, ListaPixeles),
    getWidth(Img, Ancho),
    getHeigth(Img, Alto),
    ((imagenIsBimap(Img), pixelsFlipHBit(ListaPixeles, Ancho, NewListPixels), image(Ancho, Alto, NewListPixels, NewImg));
    (imagenIsHexmap(Img), pixelsFlipHHex(ListaPixeles, Ancho, NewListPixels), image(Ancho, Alto, NewListPixels, NewImg));
    (imageIsPixmap(Img), pixelsFlipHRgb(ListaPixeles, Ancho, NewListPixels), image(Ancho, Alto, NewListPixels, NewImg))).



%-------- PREDICADO QUE DA VUELTA UNA IMAGEN VERTICALMENTE --------.

%----- PIXBIT -----
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


%----- PIXHEX -----
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

%----- PIXRGB -----
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

imageFlipV(Img, NewImg) :-
    getListaPixels(Img, ListaPixeles),
    getWidth(Img, Ancho),
    getHeigth(Img, Alto),
    ((imagenIsBimap(Img), pixelsFlipVBit(ListaPixeles, Alto, NewListPixels), image(Ancho, Alto, NewListPixels, NewImg));
    (imagenIsHexmap(Img), pixelsFlipVHex(ListaPixeles, Alto, NewListPixels), image(Ancho, Alto, NewListPixels, NewImg));
    (imageIsPixmap(Img), pixelsFlipHVRgb(ListaPixeles, Alto, NewListPixels), image(Ancho, Alto, NewListPixels, NewImg))).

%-------- PREDICADO QUE RECORTA UNA IMAGEN --------.

%----- PIXBIT -----
cropbit([],_,_,_,_,[]).
cropbit([Cabeza|Cola], X, Y, X1, Y1, PixelesFinales):-
    cropbit(Cola, X, Y, X1, Y1, PixelesOriginales),
    pixbit(Ancho, Alto,_,_ ,Cabeza),
    ( X =< Ancho, Ancho =< X1, 
      Y =< Alto, Alto =< Y1 -> append(Cabeza, PixelesOriginales, PixelesFinales);
    append([], PixelesOriginales, PixelesFinales)).

%----- PIXHEX -----
crophex([],_,_,_,_,[]).
crophex([Cabeza|Cola], X, Y, X1, Y1, PixelesFinales):-
    crophex(Cola, X, Y, X1, Y1, PixelesOriginales),
    pixhex(Ancho, Alto,_,_ ,Cabeza),
    ( X =< Ancho, Ancho =< X1, 
      Y =< Alto, Alto =< Y1 -> append(Cabeza, PixelesOriginales, PixelesFinales);
    append([], PixelesOriginales, PixelesFinales)).

%----- PIXRGB -----
croprgb([],_,_,_,_,[]).
croprgb([Cabeza|Cola], X, Y, X1, Y1, PixelesFinales):-
    croprgb(Cola, X, Y, X1, Y1, PixelesOriginales),
    pixrgb(Ancho, Alto, _, _, _, _, Cabeza),
    ( X =< Ancho, Ancho =< X1, 
      Y =< Alto, Alto =< Y1 -> append(Cabeza, PixelesOriginales, PixelesFinales);
    append([], PixelesOriginales, PixelesFinales)).

imageCrop(Img, X, Y, X1, Y1, NewImg):-
    image(X2, Y2, ListaPixeles, Img), 
    ((imagenIsBimap(Img), cropbit(ListaPixeles, X, Y, X1, Y1, NewListPixels));
     (imagenIsHexmap(Img), crophex(ListaPixeles, X, Y, X1, Y1, NewListPixels));
     (imageIsPixmap(Img), croprgb(ListaPixeles, X, Y, X1, Y1, NewListPixels))),
     image(X2, Y2, NewListPixels, NewImg).


%-------- PREDICADO QUE TRANSFORMA UNA IMAGEN RGB A HEXADECIMAL --------.
imageRGBToHex(Img, NewImg):-
    image(X, Y, ListaPixels, Img),
    imageRGBToHex(ListaPixels, NewListaPixels),
    image(X, Y, NewListaPixels, NewImg).

imageRGBToHex([],[]).
imageRGBToHex([Cabeza|Cola], PixelesHex):-
    imageRGBToHex(Cola, PixelesAntes),
    pixrgb(X, Y, R, G, B, D, Cabeza),
    dec_to_hex(R, Rojo),
    dec_to_hex(G, Verde),
    dec_to_hex(B, Azul),
    string_concat(R, G, RG),
    string_concat(RG, B, RGB),
    pixhex(X, Y, RGB, D, Pixeles),
    append([Pixeles], PixelesAntes, PixelesHex).

dec_to_hex(Value,Atom):-
    Value =< 0xFF, !,
    format(atom(Atom_lower),'|`0t~16r~2|',Value),
    upcase_atom(Atom_lower,Atom).

%-------- PREDICADO QUE CREA UN HISTOGRAMA --------.
imageToHistogram(Img, Histograma):-
    getListaPixels(Img, ListaPixeles),
    histogramaBit(ListaPixeles, Histograma).

histogramaBit([],[]). %caso base
histogramaBit(ListaPixeles, HSalida) :-
    countElement(ListaPixeles, 0, N),
    countElement(ListaPixeles, 1, N1), 
    append([[0,N]],[[1,N1]], HSalida).

countElement([], _, 0).
countElement([Elemento|RestoIn], Valor, N) :-
    countElement(RestoIn, Valor, Acc),
    getBit(Elemento, Color),
    (Color = Valor, 
    N is Acc + 1;
    N is Acc).




%-------- PREDICADO QUE CAMBIA EL PIXEL DE UNA IMAGEN --------.
imageChangePixel(Img, PixelChange, NewImg):-
    image(Ancho, Alto, ListaPixels, Img),
    ((imagenIsBimap(Img), changePixelBit(ListaPixels, PixelChange, NewListPixels));
     (imagenIsHexmap(Img), changePixelHex(ListaPixels, PixelChange, NewListPixels));
     (imageIsPixmap(Img), changePixelRgb(ListaPixels, PixelChange, NewListPixels))),
    image(Ancho, Alto, NewListPixels, NewImg).

changePixelBit([], _, []).
changePixelBit([Pixel|Resto], PixelChange, NewListPixels):-
    changePixelBit(Resto, PixelChange, ListaPixels),
    pixbit(X, Y, _, _, Pixel),
    pixbit(X1, Y1, _, _, PixelChange),
    (X = X1, Y = Y1,
    append([PixelChange], ListaPixels, NewListPixels);
    append([Pixel], ListaPixels, NewListPixels)).

changePixelHex([], _, []).
changePixelHex([Pixel|Resto], PixelChange, NewListPixels):-
    changePixelHex(Resto, PixelChange, ListaPixels),
    pixhex(X, Y, _, _, Pixel),
    pixhex(X1, Y1, _, _, PixelChange),
    (X = X1, Y = Y1,
    append([PixelChange], ListaPixels, NewListPixels);
    append([Pixel], ListaPixels, NewListPixels)).

changePixelRgb([], _, []).
changePixelRgb([Pixel|Resto], PixelChange, NewListPixels):-
    changePixelRgb(Resto, PixelChange, ListaPixels),
    pixrgb(X, Y, _, _, _, _, Pixel),
    pixrgb(X1, Y1, _, _, _, _, PixelChange),
    (X = X1, Y = Y1,
    append([PixelChange], ListaPixels, NewListPixels);
    append([Pixel], ListaPixels, NewListPixels)).


%% Meta Primaria: imageInvertColorRGB
imageInvertColorRGB(Pixel, NewPixel):-
    pixrgb(X, Y, R, G, B, D, Pixel),
    NewR is 255 - R,
    NewG is 255 - G,
    NewB is 255 - B,
    pixrgb(X, Y, NewR, NewG, NewB, D, NewPixel).