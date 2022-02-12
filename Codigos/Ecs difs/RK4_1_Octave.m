% Runge-Kutta para una ec. dif.
% Octubre del 2017
%
clear;clc;
warning('off','all');
%
disp('Método de Runge-Kutta de 4to orden.');
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
%  Lectura de datos
%
disp('Datos:');disp('  ');
x0=input('x0 = ');
xn=input('xn = ');
y0=input('y0 = ');
dx=input('Incremento de x = ');
ndx=(xn-x0)/dx;
x = [x0:dx:xn]; 
n = length(x); 
y = zeros(1,n); 
y(1) = y0;
yy = zeros(1,n);
yy(1) = y0;
disp('  ');disp('  ');
if g1~=''''
  disp('  i       x(i)         y(i)         k1           k2           k3           k4       y(i)verd')
  else
  disp('  i       x(i)         y(i)         k1           k2           k3           k4')
endif
for i = 1:ndx
    k1 = f(x(i),y(i));
    k2 = f(x(i)+dx/2,y(i)+dx*k1/2);
    k3 = f(x(i)+dx/2,y(i)+dx*k2/2);
    k4 = f(x(i)+dx,y(i)+dx*k3);
    y(i+1) = y(i)+dx*(k1+2*k2+2*k3+k4)/6;
    if g1~=''''
      yy(i+1) = g(x(i+1),y(i+1));
    endif
    %fprintf('%4.0f %12.6f %12.6f %12.6f %12.6f %12.6f %12.6f %12.6f',i-1,x(i),y(i),k1,k2,k3,k4,yy(i));fprintf('\n');
    if g1~=''''
      fprintf('%4.0f %12.6f %12.6f %12.6f %12.6f %12.6f %12.6f %12.6f',i-1,x(i),y(i),k1,k2,k3,k4,yy(i));fprintf('\n');
      else
      fprintf('%4.0f %12.6f %12.6f %12.6f %12.6f %12.6f %12.6f',i-1,x(i),y(i),k1,k2,k3,k4);fprintf('\n');
    endif
end
%fprintf('%4.0f %12.0f %12.0f',i,x(i+1),y(i+1));fprintf('\n');

hold on
if g1~=''''
  fprintf('%4.0f %12.6f %12.6f %64.6f',i,x(i+1),y(i+1),yy(i+1));fprintf('\n');
  plot(x,yy,'-ro',x,y,'-.b'); grid;
  legend('Sol. analítica','Sol. numérica','location','northeast')
else
    fprintf('%4.0f %12.6f %12.6f',i,x(i+1),y(i+1));fprintf('\n');
    plot(x,y,'-.b'); grid;
    legend('Sol. numérica')  
end
hold off

