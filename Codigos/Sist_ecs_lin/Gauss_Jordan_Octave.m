% Programa para aplicar Gauss-Jordan
%
warning('off','all');
% Ax = b;
% primero, antes de ejecutar el programa,ingresar A y b;
% Puede ser por pantalla o por Excel;
% nombre_variable=xlsread('nombre_fichero', 'nombre_hoja', 'rango'),
%
clc; clear all;
pkg load io;
A=xlsread('Libro1.xlsx','Hoja1','M5:O7');
if det(A)~= 0   % Verifica que el sistema de ecuaciones no sea singular
%    
b=xlsread('Libro1.xlsx','Hoja1','P5:P7');
disp('  ');disp('  ');
disp('Método de Gauss-Jordan.');disp('  ');
disp('  ');disp('  ');
% nr: número de renglones;
% nf: número de filas;
[nr,nc]=size(A);
if nr~=nc, error ('La matriz debe ser cuadrada');end
C=[A b];  % matriz aumentada;
disp(C);
tempo=input('','s');
% sustitución hacia adelante;
disp('  ');disp('  ');
disp('Sustitución hacia adelante:');disp('  ');
for i=1:nr-1
  if A(i,i)==0, error ('El elemento pivote es igual a cero');end
    for k=i:nr
      if A(k,i)~=0
        temp=1/A(k,i);
        A(k,:)=A(k,:)*temp;
        b(k)=b(k)*temp;
      end
    end
    C=[A b];
    disp(C);
    disp('  ');
    tempo=input('','s');
    for j=i:nr
        if i~=j
          if A(j,i)~=0
            A(j,:)=A(i,:)-A(j,:);
            b(j)=-b(j)+b(i);
          end
        end;
    end;
    if i<nr
      C=[A b];
      disp(C);
      disp('  ');
      tempo=input('','s');
    end
end;
% sustitución inversa;
disp('  ');disp('  ');
disp('Sustitución inversa:');disp('  ');
for i=nr:-1:2
    for k=i:-1:1
      if A(k,i)~=0
        temp=1/A(k,i);
        A(k,:)=A(k,:)*temp;
        b(k)=b(k)*temp;
      end
    end;
    C=[A b];
    disp(C);
    disp('  ');
    tempo=input('','s');
    for j=i-1:-1:1
      if A(j,i)~=0
        A(j,:)=A(i,:)-A(j,:);
        b(j)=b(i)-b(j);
      end
    end
    C=[A b];
    disp(C);
    disp('  ');
    tempo=input('','s');
end;
disp('  ');disp('  ');
disp('Matriz aumentada final:');disp('  ');
b(1)=b(1)/A(1,1);
A(1,1)=1;
C=[A b];
disp(C);
tempo=input('','s');
x=b
end
