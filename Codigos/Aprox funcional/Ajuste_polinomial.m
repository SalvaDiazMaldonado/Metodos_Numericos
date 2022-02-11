% Ajuste polinomial
% Noviembre del 2017
%
%Datos
%   X es un vector que contiene la lista de abcisas
%   Y es un vector que contiene la lista de ordenadas
clc; clear all;
warning('off','all');
pkg load io;
disp('  Crear previamente los vectores x y y en excel.');
disp('si ya lo creaste oprime Enter si no, oprime Ctrl C y Enter.');disp('  ');
pause;
x=xlsread('Libro1.xlsx','Hoja2','B18:E18');
y=xlsread('Libro1.xlsx','Hoja2','B19:E19');
n=length(x);
m=input('Grado del polinomio? ');
a = polyfit(x,y,m);
disp('  ');
disp('Coeficientes del polinomio ajustado');disp('  ');
format long;
for j=m+1:-1:1
  disp(a(j));disp('');
  %fprintf('%12.6f \n',a(j))
end
yest=polyval(a,x);
xmin=min(x); xmax=max(x);
xx = linspace(xmin,xmax); % genera 100 valores de xx;
yy = polyval(a,xx);
hold on;

figure 1;
plot(x,y,'o',xx,yy,'-')
grid
xlabel('x');
ylabel('y');
legend('y','y ajustada',"location", 'southeast');
%grid off;
r=corr(y,yest);
disp('  ');
fprintf('Coef. de correlación Pearson: %6.4f \n',r);
fprintf('Coef. de determinación Pearson: %6.4f \n',r^2);
fprintf('Coef. de correlación Kendall: %6.4f \n',kendall(y,yest));
fprintf('Coef. de correlación Spearman: %6.4f \n',spearman(y,yest));
disp('  ');
% cálculo de las desviaciones al cuadrado;
fxi=polyval(a,x);
error=sum((fxi-y).^2);
fprintf('Sumatoria de desviaciones al cuadrado: %10.6f\n',error);
% Error cuadrático medio;
nt=length(x); % calcula el número de términos
errorcm=sqrt(sum((fxi-y).^2)/nt);
fprintf('Error cuadrado medio: %10.6f\n',errorcm);
% Intervalos de confianza (si hubiera normalidad);
c=a;
[c,s]=polyfit(x,y,1);
[fxi,delta]=polyval(c,x,s);
linf=fxi+2*delta; lsup=fxi-2*delta;
disp('  ');
disp(' Lim. sup.     Lim. inf.')
for i=1:n
  fprintf('%10.6f %10.6f\n',linf(i), lsup(i));
endfor
figure 2;
plot(x,y,'*',x,fxi,'g-',x,fxi+2*delta,'r:',x,fxi-2*delta,'r:');
grid;
hold off;

disp('  ');disp('  ');
disp('   Introduce el valor de x a estimar.');
disp('cuando termines de estimar oprime Ctrl C.');disp('  ');
temp=0;
while (temp==0)
  x1=input('x = ');
  polyval(a,x1)
endwhile