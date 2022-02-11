% Metodo de Newton-Raphson 2018
%
% 1. Hay que crear la función f para encontrar sus raíces.
% 2. Se grafica la función, para lo cual se pregunta la xinicial % y la 
%    xfinal que cubrirá dicha gráfica.
% 3. Hace un pequeño alto para que con el cursor se ubique en la gráfica
%    el letrero que identifica el método de Bisección.
% 4. Alimentar a, b, no. de iteraciones y tolerancia.
%
warning('off','all');
% ******* Declaración de la función *****
%
pkg load symbolic
clc; clf;
% set(0, "defaulttextfontsize", 24) % title
% set(0, "defaultaxesfontsize", 24) % axes labels
disp('Método de Newton-Raphson.');
disp('  ');disp('  ');
syms x
f=input('Introduce una función con respecto a x   ');
% calcula la derivada g
g=diff(f,x); disp('  ');
%
fun = function_handle(f);
der = function_handle(g);
disp('Valores para graficar la f(x)');disp('  ');
x1=input('   desde x = ');
x2=input('   hasta x = ');
x=linspace(x1,x2,10000);
hold on;
plot(x,fun(x));
xlabel('x'); ylabel('y');
grid; legend('Newton-Raphson');
temp=input('','s');
temp=''; disp('  ');
x0=input('x inicial? ');
tol=input('Tolerancia? ');
niter=input('Iteraciones máximas? '); disp('  ');
iter=0;
i=0;
disp('       i       x      f(x)      f´(x)      delta');
x=x0;
delta1=2*tol;
while (i<=niter) & (delta1>tol)
    delta = -fun(x)/der(x);
    delta1=abs(delta);
    if i==0
        fprintf('%6.0f %10.6f %10.6f %10.6f   %10.8f\n',i,x,fun(x),der(x),delta);
        x0=x;
    else
        dif=abs(x-x0);
        x0=x;
        ea=dif/x;
        fprintf('%6.0f %10.6f %10.6f %10.6f   %10.8f\n',i,x,fun(x),der(x),delta);
    end
    plot(x,fun(x),'+ r')
    temp=input('','s');
    x = x + delta;
    i=i+1;    
end
fprintf('%6.0f %10.6f',i,x);
disp('  ');disp('  ');
plot(x,fun(x),'o g');
hold off;