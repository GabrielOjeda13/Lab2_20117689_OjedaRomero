% Gabriel Ojeda
% 20.117.689-1
% Laboratorio 2 Prolog

/*

Crear una imagen tipo PixBit.
pixbit( 0, 0, 1, 10, PA), 
pixbit( 0, 1, 0, 20, PB), 
pixbit( 1, 0, 0, 30, PC), 
pixbit( 1, 1, 1, 4, PD), 
image( 2, 2, [PA, PB, PC, PD], I),

Crear una imagen tipo Pixmap o rgb.
pixrgb( 0, 0, 10, 10, 10, 10, P1), 
pixrgb( 0, 1, 20, 20, 20, 20, P2), 
pixrgb( 1, 0, 30, 30, 30, 30, P3), 
pixrgb( 1, 1, 40, 40, 40, 40, P4), 
image( 2, 2,[ P1, P2, P3, P4], I1).

Crear una imagen tipo Hexmap.
pixhex( 0, 0, "1312", 10, PA), 
pixhex( 0, 1, "0321", 20, PB), 
pixhex( 1, 0, "0312", 30, PC), 
pixhex( 1, 1, "1312", 4, PD), 
image( 2, 2, [PA, PB, PC, PD], I).

Invertir horizontalmente una imagen tipo pixbit.
pixbit( 0, 0, 1, 10, PA), 
pixbit( 0, 1, 0, 20, PB), 
pixbit( 1, 0, 0, 30, PC), 
pixbit( 1, 1, 1, 4, PD), 
image( 2, 2, [PA, PB, PC, PD], I), 
imageFlipH( I, I2 ).

Invertir Verticalmente una imagen tipo pixbit.
pixbit( 0, 0, 1, 10, PA), 
pixbit( 0, 1, 0, 20, PB), 
pixbit( 1, 0, 0, 30, PC), 
pixbit( 1, 1, 1, 4, PD), 
image( 2, 2, [PA, PB, PC, PD], I), 
imageFlipV( I, I2 ).

Crear una histograma de una imagen tipo pixbit.
pixbit( 0, 0, 1, 10, PA), 
pixbit( 0, 1, 0, 20, PB), 
pixbit( 1, 0, 0, 30, PC), 
pixbit( 1, 1, 1, 4, PD), 
image( 2, 2, [PA, PB, PC, PD], I), 
imageToHistogram( I, Histograma).

Rotar una imagen en 90 grados.
pixbit( 0, 0, 1, 10, PA), 
pixbit( 0, 1, 0, 20, PB), 
pixbit( 1, 0, 0, 30, PC), 
pixbit( 1, 1, 1, 4, PD), 
image( 2, 2, [PA, PB, PC, PD], I), 
imageRotate90( I, I2).

Cambiar un pixel de una imagen tipo hexmap.
pixhex( 0, 0, "0132", 1, PA), 
pixhex( 0, 1, "0132", 2, PB), 
pixhex( 1, 0, "0132", 3, PC), 
pixhex( 1, 1, "0132", 4, PD), 
image( 2, 2, [PA, PB, PC, PD], I), 
pixhex( 1, 0, "013ASD", 10, PM), 
imageChangePixel( I, PM, I2).

Invertir los colores de una imagen RGB.
pixrgb( 0, 0, 10, 10, 10, 10, P1), 
pixrgb( 0, 1, 20, 20, 20, 20, P2), 
pixrgb( 1, 0, 30, 30, 30, 30, P3), 
pixrgb( 1, 1, 40, 40, 40, 40, P4), 
image( 2, 2, [P1, P2, P3, P4], I1), 
imageInvertColorRGB(P2, P2_modificado), 
imageChangePixel(I1, P2_modificado, I2).

Transformar una imagen RGB a Hexadecimal.
pixrgb( 0, 0, 10, 10, 10, 10, P1), 
pixrgb( 0, 1, 20, 20, 20, 20, P2), 
pixrgb( 1, 0, 30, 30, 30, 30, P3), 
pixrgb( 1, 1, 40, 40, 40, 40, P4), 
image( 2, 2,[ P1, P2, P3, P4], I1), 
imageRGBToHex( I1, I2).

*/