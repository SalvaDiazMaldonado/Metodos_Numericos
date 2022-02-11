% Ajuste polinomial múltiple
% https://www.ritchieng.com/multi-variable-linear-regression/
% Septiembre 2018
%
%Datos
%   X es un vector que contiene la lista de abcisas
%   Y es un vector que contiene la lista de ordenadas
clc; clear all;
warning('off','all');
pkg load io;
disp('  Crear previamente los vectores x y y en excel.');
disp('si ya lo creaste oprime Enter si no, oprime Ctrl C.');disp('  ');
pause;
x=xlsread('Libro2.xlsx','Hoja1','A2:C17');
y=xlsread('Libro2.xlsx','Hoja1','D2:D17');
sol=pinv(x'*x)*x'*y;
[nr, nc] = size(x);
for i=1:nc
  fprintf('%10.6f\n',sol(i))
endfor
