% Gabriel Ojeda
% 20.117.689-1
% Laboratorio 2 Prolog


%%--------------- TDA IMAGE ---------------.
%%--------------- VARIABLES GENERALES ---------------.

%   Width: Corresponde al ancho de la imágen
%   Height: Corresponde al alto de la imágen
%   ListaPixels: Correspendo a una lista de elementos de cualquier tipo de pixel.

%Predicados.
%%--------------- CONSTRUCTORES ---------------.
%Constructor image.
image(Width, Height, ListaPixels,[Width, Height, ListaPixels]).


%%--------------- SELECTORES ---------------.
%Selectorres image
getWidth([Width|_],Width).
getHeigth([_|[Height|_]],Height).
getListaPixels([_|[_|[ListaPixels|_]]],ListaPixels).

%%--------------- PERTENENCIAS ---------------.
%Predicado isBitmap?
imagenIsBimap(Img):-
    getListaPixels(Img,ListaPixeles), validePixelIsBitmap(ListaPixeles).


%Predicado isHexmap?
imagenIsHexmap(Img):-
    getListaPixels(Img,ListaPixeles), validePixelIsHexmap(ListaPixeles).


%Predicado isPixmap? (Pixel RGB).
imageIsPixmap(Img):-
    getListaPixels(Img,ListaPixeles), validePixelIsPixmap(ListaPixeles).



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



%--------------- PREDICOS BASE PARA OTROS PREDICADOS ---------------.

%%--------------- SELECTORES ---------------.
%Generales pixels
getX([X|_],X).
getY([_|[Y|_]],Y).

%%--------------- AGREGAR ELEMENTO EN LISTA ---------------.
appendElement( Elemento, [], [Elemento]).
appendElement( Elemento, Lista, [Elemento|Lista]).


%% Meta Primaria: imageFlip
%% Meta Secundaria: imagen ; imagen rotada
%% Descripcion: Predicado que permite rotar una imagen horizontalmente.
imageFlipH(Img, NewImg) :-
    getListaPixels(Img, ListaPixeles),
    getWidth(Img, Ancho),
    getHeigth(Img, Alto),
    ((imagenIsBimap(Img), pixelsFlipHBit(ListaPixeles, Ancho, NewListPixels), image(Ancho, Alto, NewListPixels,NewImg));
    (imagenIsHexmap(Img), pixelsFlipHHex(ListaPixeles, Ancho, NewListPixels), image(Ancho, Alto, NewListPixels,NewImg));
    (imageIsPixmap(Img), pixelsFlipHRgb(ListaPixeles, Ancho, NewListPixels), image(Ancho, Alto, NewListPixels,NewImg))).


%% Meta Primaria: imageFlipV
%% Meta Secundaria: imagen ; imagen rotada
%% Descripcion: Predicado que permite rotar una imagen Verticalmente.
imageFlipV(Img, NewImg) :-
    getListaPixels(Img, ListaPixeles),
    getWidth(Img, Ancho),
    getHeigth(Img, Alto),
    ((imagenIsBimap(Img), pixelsFlipVBit(ListaPixeles, Alto, NewListPixels), image(Ancho, Alto, NewListPixels,NewImg));
    (imagenIsHexmap(Img), pixelsFlipVHex(ListaPixeles, Alto, NewListPixels), image(Ancho, Alto, NewListPixels,NewImg));
    (imageIsPixmap(Img), pixelsFlipHVRgb(ListaPixeles, Alto, NewListPixels), image(Ancho, Alto, NewListPixels,NewImg))).


%% Meta Primaria: imageCrop
%% Meta Secundaria: imagen ; imagen recortada
%% Descripcion: Predicado que permite rocortar una imagen.
imageCrop(Img, X, Y, X1, Y1, NewImg):-
    image(X2, Y2, ListaPixeles, Img),
    ((imagenIsBimap(Img), cropbit(ListaPixeles, X, Y, X1, Y1, NewListPixels));
     (imagenIsHexmap(Img), crophex(ListaPixeles, X, Y, X1, Y1, NewListPixels));
     (imageIsPixmap(Img), croprgb(ListaPixeles, X, Y, X1, Y1, NewListPixels))),
     image(X2, Y2, NewListPixels,NewImg).

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


%% Meta Primaria: imageRGB
%% Descripcion: Predicado transforma una imagen a Hexadecimal.
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
    string_concat(Rojo, Verde, RG),
    string_concat(RG, Azul, RGB),
    pixhex(X, Y, RGB, D, Pixeles),
    append([Pixeles], PixelesAntes, PixelesHex).

%Predicado Complementario, Extraido del sitio WEB https://discourse.swi-prolog.org/t/convert-decimal-number-to-hexadecimal-number-as-atom-with-zero-padding-on-left/2631
dec_to_hex(Value,Atom) :-
    Value =< 0xFF, !,
    format(atom(Atom_lower),'~|~`0t~16r~2|',Value),
    upcase_atom(Atom_lower,Atom).
dec_to_hex(Value,Atom) :-
    Value =< 0xFFFF, !,
    format(atom(Atom_lower),'~|~`0t~16r~4|',Value),
    upcase_atom(Atom_lower,Atom).
dec_to_hex(Value,Atom) :-
    Value =< 0xFFFFFFFF, !,
    format(atom(Atom_lower),'~|~`0t~16r~8|',Value),
    upcase_atom(Atom_lower,Atom).
dec_to_hex(Value,Atom) :-
    Value =< 0xFFFFFFFFFFFFFFFF,
    format(atom(Atom_lower),'~|~`0t~16r~16|',Value),
    upcase_atom(Atom_lower,Atom).
dec_to_hex(Value,Atom) :-
    format(atom(Atom_lower),'~16r',Value),
    upcase_atom(Atom_lower,Atom).


%% Meta Primaria: imageToHistogram
%% Descripcion: Predicado que crea un histograma.
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


%% Meta Primaria: imageChangePixel.
%% Meta Secundaria: imagen ; pixels
%% Descripcion: Predicado que cambia el pixel de una imagen.
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
%% Descripcion: Predicado que invertir el color de un pixel rgb.
imageInvertColorRGB(Pixel, NewPixel):-
    pixrgb(X, Y, R, G, B, D, Pixel),
    NewR is 255 - R,
    NewG is 255 - G,
    NewB is 255 - B,
    pixrgb(X, Y, NewR, NewG, NewB, D, NewPixel).


%% Meta Primaria: imageRotate90
%% Meta Secundaria: imagen ; imagen rotada
%% Descripcion: Predicado que permite rotar una imagen en 90 grados.
imageRotate90(Img,NewImg):-
	getListaPixels(Img,ListaPixels),
	getWidth(Img,Ancho),
	getHeigth(Img,Alto),
    ((imagenIsBimap(Img), rotarPixelBit(ListaPixels, Ancho, NewListaPixels));
     (imagenIsHexmap(Img), rotarPixelHex(ListaPixels, Ancho, NewListaPixels));
     (imageIsPixmap(Img), rotarPixelRgb(ListaPixels, Ancho, NewListaPixels))),
    image( Alto, Ancho,NewListaPixels, NewImg).

rotarPixelBit([],_,[]).
rotarPixelBit([Pixel|Cola],Ancho,[NewPixel|Cola2]):-
    getX(Pixel,X),getY(Pixel,Y),
    X2 is Y,
    Y2 is Ancho-1-X,
    getBit(Pixel,Bit),
    getDepthBit(Pixel,Depth),
    pixbit(X2, Y2, Bit, Depth,NewPixel),
    rotarPixelBit(Cola,Ancho,Cola2).

rotarPixelHex([],_,[]).
rotarPixelHex([Pixel|Cola],Ancho,[NewPixel|Cola2]):-
    getX(Pixel,X),getY(Pixel,Y),
    X2 is Y,
    Y2 is Ancho-1-X,
    getHex(Pixel,Hex),
    getDepthHex(Pixel,Depth),
    pixhex(X2, Y2, Hex, Depth,NewPixel),
    rotarPixelHex(Cola,Ancho,Cola2).

rotarPixelRgb([],_,[]).
rotarPixelRgb([Pixel|Cola],Ancho,[NewPixel|Cola2]):-
    getX(Pixel,X),getY(Pixel,Y),
    X2 is Y,
    Y2 is Ancho-1-X,
    getR(Pixel,R),
    getG(Pixel,G),
    getB(Pixel,B),
    getDepthRgb(Pixel,Depth),
    pixrgb(X2, Y2, R,G,B, Depth,NewPixel),
    rotarPixelRgb(Cola,Ancho,Cola2).


%% Meta Primaria: imageToString
%% Meta Secundaria: imagen ; imagen en string
%% Descripcion: Predicado que transforma una imagen a string.
pixelStringBit([], _, _, _):- !.
pixelStringBit([Pixel|Resto], Ancho, Count, ListaPixelString):-
		pixbit(_, _, Bit, _, Pixel),
		(Count = 0, NewCount is Count + 1,
            string_concat(Bit,"\t", NewListaPixelString);
            Count < Ancho, Count > 0, NewCount is Count + 1,
            string_concat(Bit,"\t", NewPixelString),
            string_concat(NewPixelString, ListaPixelString, NewListaPixelString);
		NewCount is Count + 1,
            string_concat(Bit,"\n", NewPixelString),
            string_concat(NewPixelString, ListaPixelString, NewListaPixelString)),
            pixelStringBit(Resto, Ancho, NewCount, NewListaPixelString).

imageToString([], "").
imageToString(Img, NewImgStr):-
		image(Ancho, _, ListaPixels, Img),
		pixelStringBit(ListaPixels, Ancho, 0, NewImgStr).
