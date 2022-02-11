% M�todo de Bisecci�n 2018;
% 1. Hay que crear la funci�n f para encontrar sus ra�ces.
% 2. Se grafica la funci�n, para lo cual se pregunta la xinicial % y la 
%    xfinal que cubrir� dicha gr�fica.
% 3. Hace un peque�o alto para que con el cursor se ubique en la gr�fica
%    el letrero que identifica el m�todo de Bisecci�n.
% 4. Alimentar a, b, no. de iteraciones y tolerancia.
%
clc; clear all; clf;
% set(0, "defaulttextfontsize", 24) % title
% set(0, "defaultaxesfontsize", 24) % axes labels

warning('off','all');
disp('M�todo de Bisecci�n.');
disp('  ');disp('  ');
f=input('Introduce una funci�n con respecto a x  ','s');disp('  ');
f=strcat('@(x,y)',f); f=str2func(f);
disp('Valores para graficar la f(x)');disp('  ');
x1=input('x inicial? ');
x2=input('x final? ');
x=linspace(x1,x2,5000);
for i=1:5000
  y(i)=f(x(i));
end
hold on
%figure(1);
plot(x,y);
xlabel('x'); ylabel('y');
grid; 
legend('Bisecci�n')

temp=input('','s');
disp('M�todo de Bisecci�n.');
disp('  ');
disp('Datos:');disp('  ');
a=input('a = ');
b=input('b = ');
niter=input('Iteraciones m�ximas = ');
tol = input('Tolerancia = ');
xm=a+b;


plot(a,f(a),'+ r')
iter=0;
disp('  ');disp('  ');
disp('    i       a          b        xm      f(b)*f(xm)    f(xm)');
if f(a)*f(b)<=0
    while (abs(f(xm))>tol) & (iter<niter)
        xm = (a+b)/2;
        fprintf('%6.0f %10.6f %10.6f %10.6f %10.6f %10.6f\n',iter,a,b,xm,f(b)*f(xm),f(xm));
        plot(a,f(a),'+ r',"markersize", 20);
        plot(b,f(b),'+ r',"markersize", 20);
        plot(xm,f(xm),'+ r',"markersize", 20);
        %figure(2);
        temp=input('','s');
        if f(b)*f(xm)>0
            b=xm;
        else
            a=xm;
        end
        iter=iter+1;
    end
    if iter>=0
        fprintf('Ra�z:');fprintf('%10.6f \n',xm);
        plot(xm,f(xm),'o g',"markersize", 20)
        hold off;
    end
else
    disp('  ');disp('  ');
    disp('Sin soluci�n para los puntos iniciales a y b:');
    disp('    i       a          b     f(a)*f(b)');
    fprintf('%6.0f %10.6f %10.6f %10.6f',iter,a,b,f(b)*f(a));fprintf('\n');
end
hold off
