% Gabriel Ojeda
% 20.117.689-1
% Laboratorio 2 Prolog
% ---------- COMODÍN ----------.

/*

Crear una imagen tipo PixBit.
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I).
pixbit( 0, 0, 0, 75, PA), pixbit( 0, 1, 0, 65, PB), pixbit( 1, 0, 0, 55, PC), pixbit( 1, 1, 0, 45, PD), image( 2, 2, [PA, PB, PC, PD], I).
pixbit( 0, 0, 1, 1, PA), pixbit( 0, 1, 1, 2, PB), pixbit( 1, 0, 1, 3, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I).

Crear una imagen tipo Pixmap o rgb.
pixrgb( 0, 0, 10, 10, 10, 10, P1), pixrgb( 0, 1, 20, 20, 20, 20, P2), pixrgb( 1, 0, 30, 30, 30, 30, P3), pixrgb( 1, 1, 40, 40, 40, 40, P4), image( 2, 2,[ P1, P2, P3, P4], I1).
pixrgb( 0, 0, 199, 199, 0, 10, P1), pixrgb( 0, 1, 199, 199, 0, 20, P2), pixrgb( 1, 0, 0, 199, 199, 30, P3), pixrgb( 1, 1, 0, 0, 199, 40, P4), image( 2, 2,[ P1, P2, P3, P4], I1).
pixrgb( 0, 0, 255, 255, 255, 50, P1), pixrgb( 0, 1, 200, 200, 200, 40, P2), pixrgb( 1, 0, 150, 150, 150, 30, P3), pixrgb( 1, 1, 100, 100, 100, 20, P4), image( 2, 2,[ P1, P2, P3, P4], I1).

Crear una imagen tipo Hexmap.
pixhex( 0, 0, "#FFFFFF", 10, PA), pixhex( 0, 1, "#000000", 20, PB), pixhex( 1, 0, "#000000", 30, PC), pixhex( 1, 1, "#FFFFFF", 40, PD), image( 2, 2, [PA, PB, PC, PD], I).
pixhex( 0, 0, "#00C7C7", 15, PA), pixhex( 0, 1, "#00C7C7", 15, PB), pixhex( 1, 0, "#00E9E9", 50, PC), pixhex( 1, 1, "#FFE9E9", 50, PD), image( 2, 2, [PA, PB, PC, PD], I).
pixhex( 0, 0, "#D90000", 1, PA), pixhex( 0, 1, "#D80000", 2, PB), pixhex( 1, 0, "#E90000", 3, PC), pixhex( 1, 1, "#E90000", 4, PD), image( 2, 2, [PA, PB, PC, PD], I).

Ejemplos de uso imagenIsBimap (is bitmap) predicado que valida si la imagen es del tipo pixel bit:
El primer ejemplo esta correcto, sin embargo los otros 2 no, ya que son tipo rgb y hex, por lo que arroja "false".
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imagenIsBimap( I ).
pixrgb( 0, 0, 255, 255, 255, 50, P1), pixrgb( 0, 1, 200, 200, 200, 40, P2), pixrgb( 1, 0, 150, 150, 150, 30, P3), pixrgb( 1, 1, 100, 100, 100, 20, P4), image( 2, 2,[ P1, P2, P3, P4], I), imagenIsBimap( I ).
pixhex( 0, 0, "#D90000", 1, PA), pixhex( 0, 1, "#D80000", 2, PB), pixhex( 1, 0, "#E90000", 3, PC), pixhex( 1, 1, "#E90000", 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imagenIsBimap( I ).

Ejemplos de uso imagenIsHexmap (is hexmap) predicado que valida si la imagen es del tipo pixel hex:
El primer ejemplo esta correcto, sin embargo los otros 2 no, ya que son tipo bit y rgb, por lo que arroja "false".
pixhex( 0, 0, "#FFFFFF", 10, PA), pixhex( 0, 1, "#000000", 20, PB), pixhex( 1, 0, "#000000", 30, PC), pixhex( 1, 1, "#FFFFFF", 40, PD), image( 2, 2, [PA, PB, PC, PD], I), imagenIsHexmap( I ).
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imagenIsHexmap( I ).
pixrgb( 0, 0, 255, 255, 255, 50, P1), pixrgb( 0, 1, 200, 200, 200, 40, P2), pixrgb( 1, 0, 150, 150, 150, 30, P3), pixrgb( 1, 1, 100, 100, 100, 20, P4), image( 2, 2,[ P1, P2, P3, P4], I), imagenIsHexmap( I ).

Ejemplos de uso imagenIsPixmap (is pixmap o rgb) predicado que valida si la imagen es del tipo pixel hex:
El primer ejemplo esta correcto, sin embargo los otros 2 no, ya que son tipo hex y bit, por lo que arroja "false".
pixrgb( 0, 0, 199, 199, 0, 10, P1), pixrgb( 0, 1, 199, 199, 0, 20, P2), pixrgb( 1, 0, 0, 199, 199, 30, P3), pixrgb( 1, 1, 0, 0, 199, 40, P4), image( 2, 2,[ P1, P2, P3, P4], I), imageIsPixmap( I ).
pixhex( 0, 0, "#FFFFFF", 10, PA), pixhex( 0, 1, "#000000", 20, PB), pixhex( 1, 0, "#000000", 30, PC), pixhex( 1, 1, "#FFFFFF", 40, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsPixmap( I ).
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsPixmap( I ).

Ejemplos de uso imageIsCompressed (is Crompress):
Las 2 primeras imagenes no estan comprimida por lo que retorna un False, sin embargo la ultima si lo esta, dado que le faltan pixeles y retorna un True
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsCompressed(I, Bool).
pixrgb( 0, 0, 1, 34, 200, 10, PA), pixrgb( 0, 1, 67, 34, 200, 20, PB), pixrgb( 1, 0, 12, 124, 220, 0, PC), pixrgb( 1, 1, 0, 0, 0, 23, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsCompressed(I, Bool).
pixhex( 0, 0, "#FFFFFF", 10, PA), pixhex( 0, 1, "#000000", 20, PB), image( 2, 1, [PA, PB, PC, PD], I), imageIsCompressed(I, Bool).

Crear una imagen de distinto tipo de pixels e Invertir horizontalmente dicha imagen (FlipH).
En el primer ejemplo, se invierte 2 veces, lo cual nos retorna la misma imagen original al aplicar este predicado 2 veces.
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageFlipH( I, I2 ), imageFlipH( I2, I3 ).
pixhex( 0, 0, "#00C7C7", 15, PA), pixhex( 0, 1, "#00C7C7", 15, PB), pixhex( 1, 0, "#00E9E9", 50, PC), pixhex( 1, 1, "#FFE9E9", 50, PD), image( 2, 2, [PA, PB, PC, PD], I), imageFlipH( I, I2 ).
pixrgb( 0, 0, 255, 255, 255, 50, P1), pixrgb( 0, 1, 200, 200, 200, 40, P2), pixrgb( 1, 0, 150, 150, 150, 30, P3), pixrgb( 1, 1, 100, 100, 100, 20, P4), image( 2, 2,[ P1, P2, P3, P4], I), imageFlipH( I, I2 ).

Crear una imagen de distinto tipo de pixels e Invertir verticalmente dicha imagen (FlipV).
En el primer ejemplo, se invierte 2 veces, lo cual nos retorna la misma imagen original al aplicar este predicado 2 veces.
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageFlipV( I, I2 ), imageFlipV( I2, I3 ).
pixhex( 0, 0, "#FFFFFF", 10, PA), pixhex( 0, 1, "#000000", 20, PB), pixhex( 1, 0, "#000000", 30, PC), pixhex( 1, 1, "#FFFFFF", 40, PD), image( 2, 2, [PA, PB, PC, PD], I), imageFlipV( I, I2 ).
pixrgb( 0, 0, 10, 10, 10, 10, P1), pixrgb( 0, 1, 20, 20, 20, 20, P2), pixrgb( 1, 0, 30, 30, 30, 30, P3), pixrgb( 1, 1, 40, 40, 40, 40, P4), image( 2, 2,[ P1, P2, P3, P4], I), imageFlipV( I, I2 ).

Ejemplos de uso imageCrop (is Crop):
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageCrop(I, 0, 0, 0, 0, I2).
pixrgb( 0, 0, 1, 34, 200, 10, PA), pixrgb( 0, 1, 67, 34, 200, 20, PB), pixrgb( 1, 0, 12, 124, 220, 0, PC), pixrgb( 1, 1, 0, 0, 0, 23, PD), image( 2, 2, [PA, PB, PC, PD], I), imageCrop(I, 1, 1, 1, 1, I2).
pixhex( 0, 0, "#FFFFFF", 10, PA), pixhex( 0, 1, "#000000", 20, PB), pixhex( 1, 0, "#000000", 30, PC), pixhex( 1, 1, "#FFFFFF", 40, PD), image( 2, 2, [PA, PB, PC, PD], I), imageCrop(I, 1, 1, 1, 1, I2).

Transformar una imagen RGB a Hexadecimal.
pixrgb( 0, 0, 10, 10, 10, 10, P1), pixrgb( 0, 1, 20, 20, 20, 20, P2), pixrgb( 1, 0, 30, 30, 30, 30, P3), pixrgb( 1, 1, 40, 40, 40, 40, P4), image( 2, 2,[ P1, P2, P3, P4], I1), imageRGBToHex( I1, I2).
pixrgb( 0, 0, 255, 255, 255, 50, P1), pixrgb( 0, 1, 200, 200, 200, 40, P2), pixrgb( 1, 0, 150, 150, 150, 30, P3), pixrgb( 1, 1, 100, 100, 100, 20, P4), image( 2, 2,[ P1, P2, P3, P4], I1), imageRGBToHex( I1, I2).
pixrgb( 0, 0, 199, 199, 0, 10, P1), pixrgb( 0, 1, 199, 199, 0, 20, P2), pixrgb( 1, 0, 0, 199, 199, 30, P3), pixrgb( 1, 1, 0, 0, 199, 40, P4), image( 2, 2,[ P1, P2, P3, P4], I1),  imageRGBToHex( I1, I2).

Crear una histograma de una imagen tipo pixbit.
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageToHistogram( I, Histograma).
pixbit( 0, 0, 0, 55, PA), pixbit( 0, 1, 0, 50, PB), pixbit( 1, 0, 0, 45, PC), pixbit( 1, 1, 0, 40, PD), image( 2, 2, [PA, PB, PC, PD], I), imageToHistogram( I, Histograma).

Rotar una imagen en 90 grados.
En el ejemplo 2, se rota 4 veces una imagen tipo hex, siendo la imagen inicial igual a la imagen resultante (I5) tras haber aplicado el predicado 4 veces.
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageRotate90( I, I2).
pixhex( 0, 0, "#FFFFFF", 10, PA), pixhex( 0, 1, "#000000", 20, PB), pixhex( 1, 0, "#000000", 30, PC), pixhex( 1, 1, "#FFFFFF", 40, PD), image( 2, 2, [PA, PB, PC, PD], I), imageRotate90( I, I2), imageRotate90( I2, I3), imageRotate90( I3, I4), imageRotate90( I4, I5).
pixrgb( 0, 0, 199, 199, 0, 10, P1), pixrgb( 0, 1, 199, 199, 0, 20, P2), pixrgb( 1, 0, 0, 199, 199, 30, P3), pixrgb( 1, 1, 0, 0, 199, 40, P4), image( 2, 2, [P1, P2, P3, P4], I), imageRotate90( I, I2), imageRotate90( I2, I3).

Cambiar el pixel de una imagen (imageChangePixel).
pixhex( 0, 0, "#00C7C7", 15, PA), pixhex( 0, 1, "#00C7C7", 15, PB), pixhex( 1, 0, "#00E9E9", 50, PC), pixhex( 1, 1, "#FFE9E9", 50, PD), image( 2, 2, [PA, PB, PC, PD], I), pixhex( 0, 0, "#FFFFFF", 10, PM), imageChangePixel( I, PM, I2).
pixrgb( 0, 0, 255, 255, 255, 50, P1), pixrgb( 0, 1, 200, 200, 200, 40, P2), pixrgb( 1, 0, 150, 150, 150, 30, P3), pixrgb( 1, 1, 100, 100, 100, 20, P4), image( 2, 2,[ P1, P2, P3, P4], I), pixrgb( 0, 0, 0, 0, 0, 10, PM), imageChangePixel( I, PM, I2).
pixhex( 0, 0, "#00C7C7", 15, PA), pixhex( 0, 1, "#00C7C7", 15, PB), pixhex( 1, 0, "#00E9E9", 50, PC), pixhex( 1, 1, "#FFE9E9", 50, PD), image( 2, 2, [PA, PB, PC, PD], I), pixhex( 0, 0, "#FFFFFF", 10, PM), imageChangePixel( I, PM, I2).

Invertir los colores de una imagen RGB.
pixrgb( 0, 0, 10, 10, 10, 10, P1), 
pixrgb( 0, 1, 20, 20, 20, 20, P2), 
pixrgb( 1, 0, 30, 30, 30, 30, P3), 
pixrgb( 1, 1, 40, 40, 40, 40, P4), 
image( 2, 2, [P1, P2, P3, P4], I1), 
imageInvertColorRGB(P2, P2_modificado), 
imageChangePixel(I1, P2_modificado, I2).



*/