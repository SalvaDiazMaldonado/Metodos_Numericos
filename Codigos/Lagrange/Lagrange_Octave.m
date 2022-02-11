% Interpolación de Lagrange;
%
%Datos
%   X es un vector que contiene la lista de abcisas
%   Y es un vector que contiene la lista de ordenadas
% Resultado: 
%   A matriz de coeficientes del polinomio
clc; clear all;
warning('off','all');
pkg load io;
disp('                     Interpolación de Lagrange');disp('  ');disp('  ');
disp('     Crear previamente los vectores X y Y en excel.');disp('  ');
disp('En caso de no haberlo hecho aún, oprime Ctrl c y créalo,');
disp('              si ya lo creaste, oprime Enter');
disp('  ');
pause;
X=xlsread('Libro1.xlsx','Hoja1','A22:F22');
Y=xlsread('Libro1.xlsx','Hoja1','A23:F23');
w=length(X);
A=zeros(w,1);
n=w-1;
% Calcula los valores de A;
for k=1:w
    den=1;
    for j=1:w
        if k~=j
            den=den*(X(k)-X(j));
        end
    end
    A(k)=Y(k)/den;
end;
disp('  ');
disp('Valores de las')
fprintf('%6.0f',w)
disp(' Aes');disp('   ');
A
%for k=1:w
%    fprintf('%10.6f\n',A(k));
%    disp(A(k))
%end

XX1=zeros(100,1); YY1=zeros(100,1);
XX1=linspace(X(1),X(w));

for k=1:100
    x1=XX1(k);
    for i=1:w
        YY(i)=1;
        for j=1:w
            if i~=j;
                YY(i)=YY(i)*(x1-X(j));
            end
        end
    end
    y1=0;
    for i=1:w
        y1=y1+A(i)*YY(i);
    end
    YY1(k)=y1;
end

plot(X,Y,'g-o',XX1,YY1,'--');
xlabel('x');
ylabel('y');
legend('x','x Lagrange',"location", 'southeast');
grid;
disp('  ');disp('  ');
disp('Cuando termines de interpolar oprime Ctrl c')
disp('  ');disp('  ');
YY=ones(w,1);
for k=1:100
    x1=input('x1 = ');
    for i=1:w
        YY(i)=1;
        for j=1:w
            if i~=j;
                YY(i)=YY(i)*(x1-X(j));
            end
        end
    end
    y1=0;
    for i=1:w
        y1=y1+A(i)*YY(i);
    end
    fprintf('%10.6f',y1);
    disp('  '); disp('  ');
end
