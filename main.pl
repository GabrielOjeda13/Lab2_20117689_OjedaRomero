% Gabriel Ojeda
% 20.117.689-1
% Laboratorio 2 Prolog


:-use_module(tdapixbit).
:-use_module(tdapixhex).
:-use_module(tdapixrgb).
:-use_module(predicadosbase).
:-use_module(tdaimagen).


%% Meta Primaria: imageFlip
%% Meta Secundaria: imagen ; imagen rotada
%% Descripcion: Predicado que permite rotar una imagen horizontalmente.
imageFlipH(Img, NewImg) :-
    getListaPixels(Img, ListaPixeles),
    getWidth(Img, Ancho),
    getHeigth(Img, Alto),
    ((imagenIsBimap(Img), pixelsFlipHBit(ListaPixeles, Ancho, NewListPixels), image(Ancho, Alto, NewListPixels, NewImg));
    (imagenIsHexmap(Img), pixelsFlipHHex(ListaPixeles, Ancho, NewListPixels), image(Ancho, Alto, NewListPixels, NewImg));
    (imageIsPixmap(Img), pixelsFlipHRgb(ListaPixeles, Ancho, NewListPixels), image(Ancho, Alto, NewListPixels, NewImg))).


%% Meta Primaria: imageFlipV
%% Meta Secundaria: imagen ; imagen rotada
%% Descripcion: Predicado que permite rotar una imagen Verticalmente.
imageFlipV(Img, NewImg) :-
    getListaPixels(Img, ListaPixeles),
    getWidth(Img, Ancho),
    getHeigth(Img, Alto),
    ((imagenIsBimap(Img), pixelsFlipVBit(ListaPixeles, Alto, NewListPixels), image(Ancho, Alto, NewListPixels, NewImg));
    (imagenIsHexmap(Img), pixelsFlipVHex(ListaPixeles, Alto, NewListPixels), image(Ancho, Alto, NewListPixels, NewImg));
    (imageIsPixmap(Img), pixelsFlipHVRgb(ListaPixeles, Alto, NewListPixels), image(Ancho, Alto, NewListPixels, NewImg))).


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
    string_concat(R, G, RG),
    string_concat(RG, B, RGB),
    pixhex(X, Y, RGB, D, Pixeles),
    append([Pixeles], PixelesAntes, PixelesHex).

dec_to_hex(Value,Atom):-
    Value =< 0xFF, !,
    format(atom(Atom_lower),'|`0t~16r~2|',Value),
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
