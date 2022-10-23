% Gabriel Ojeda
% 20.117.689-1
% Laboratorio 2 Prolog

%VARIABLES

%   Width: Corresponde al ancho de la imágen
%   Height: Corresponde al alto de la imágen
%   ListaPixels: Correspendo a una lista de elementos de cualquier tipo de pixel.

%Predicados.
%CONSTRUCTOR TDA image.
image(Width, Height, ListaPixels,[Width, Height, ListaPixels]).

%SELECTORES TDA image
getWidth([Width|_],Width).
getHeigth([_|[Height|_]],Height).
getListaPixels([_|[_|[ListaPixels|_]]],ListaPixels).