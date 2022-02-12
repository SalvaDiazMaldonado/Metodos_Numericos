% Método de Euler para resolver una EDO;
%
clc; clear all;
% set(0, "defaulttextfontsize", 24) % title
% set(0, "defaultaxesfontsize", 24) % axes labels
pkg load symbolic;
warning('off','all');
%
disp('Método de Euler.');
disp('  ');
%  Lectura de datos
%
f=input('Introduce una función con respecto a x  ','s');
disp(' ');
f=strcat('@(x,y)',f); f=str2func(f);
g1=input('Introduce la solución analítica (Oprime Enter si no existe)  ','s');
if g1~=''''
  g=strcat('@(x,y)',g1); g=str2func(g);
end
disp('  ');
disp('Datos:');disp('  ');
x0=input('x0 = ');
xn=input('xn = ');
y0=input('y0 = ');
dx=input('Incremento de x = ');
disp('  ');disp('  ');
if g1~=''''
    disp('    i      x(i)         y(i)       y(i)verd.    e');
else
    disp('    i      x(i)       y(i)');
end
ndx=(xn-x0)/dx;
x = [x0:dx:xn]; 
n = length(x); 
y = zeros(1,n);
if g1~=''''
    yy = zeros(1,n);
    e = zeros(1,n);
end
y(1) = y0;

for j = 1:n
    if j==1
        if g1~=''''
            yy(j) = g(x(j),y(j));
            if yy(j)==0
                e(j)=0;
            else
              e(j)= ((yy(j)-y(j))/yy(j))*100;
            end
            fprintf('%6.0f %10.6f %12.6f %12.6f %8.2f',j-1,x(j),y(j),yy(j),abs(e(j)));fprintf('\n'); 
        else
            fprintf('%6.0f %10.6f %12.6f %12.6f %8.2f',j-1,x(j),y(j));fprintf('\n'); 
        end
    else
        y(j) = y(j-1) + dx*f(x(j-1),y(j-1));
        if g1~=''''
            yy(j) = g(x(j),y(j));
            e(j)= ((yy(j)-y(j))/yy(j))*100;
            fprintf('%6.0f %10.6f %12.6f %12.6f %8.2f',j-1,x(j),y(j),yy(j),abs(e(j)));fprintf('\n');
        else
            fprintf('%6.0f %10.6f %12.6f %12.2f %8.2f',j-1,x(j),y(j));fprintf('\n');
        end
    end
end
hold on
if g1~=''''
    plot(x,yy,'-ro',x,y,'-.b'); grid;
    legend('Sol. analítica','Sol. numérica','location','northeast')
else
    plot(x,y,'-.b'); grid;
    legend('Sol. numérica')  
end
hold off


