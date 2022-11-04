% Gabriel Ojeda
% 20.117.689-1
% Laboratorio 2 Prolog

:-use_module(tdapixbit).
:-use_module(tdapixhex).
:-use_module(tdapixrgb).
:-use_module(predicadosbase).



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
