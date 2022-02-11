% Programa para aplicar matriz Inversa
%
warning('off','all');
% Ax = b;
% primero, antes de ejecutar el programa,ingresar A y b;
% Puede ser por pantalla o por Excel;
% nombre_variable=xlsread('nombre_fichero', 'nombre_hoja', 'rango'),
%
clc; clear all;
pkg load io;
A=xlsread('Libro1.xlsx','Hoja1','A40:E44');
if det(A)~= 0   % Verifica que el sistema de ecuaciones no sea singular
%    
  b=xlsread('Libro1.xlsx','Hoja1','F40:F44');
  disp('  ');disp('  ');
  disp('Matriz Inversa.');disp('  ');
  disp('  ');disp('  ');
  A
  disp('  ');disp('  ');
  b
  disp('  ');disp('  ');
  A_inversa=inv(A);
  A_inversa
  disp('  ');disp('  ');
  x=A\b
  else
  disp('  ');
  disp('** No tiene solución porque es singular**')
endif