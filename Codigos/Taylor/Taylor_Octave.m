% Series de Taylor
% Marzo 2018
%
% aceleradores de gr�ficas;
% clear all
warning('off','all');
pkg load symbolic
clc
disp('** Este programa determina la serie de Taylor, simb�lica y')
disp('   num�ricamente, de una funci�n f(x)suministrada por pantalla **')
disp('  ')
syms x
f=input('Introduce una funci�n con respecto a x   ');
fx=function_handle(f);
x0=input('Expandir alrededor de x0 = ? ');
if (x0==0)
  disp('  ')
  disp('***  Serie de Maclaurin ***')
  disp('  ')
endif
x1=input('Determinar en x          = ? ');
% N�mero de t�rminos de la serie de Taylor 'Order'
n=input('N�mero de t�rminos de la serie de Taylor = ? ');  
t = sym('t', [1 n]);
h=zeros(n,1);
disp('  '); disp('  ');
disp('T�rminos,  Serie  y su valor');
disp('  ');
for i=1:n   % Calcula el n�mero de t�rminos de la serie de Taylor
    t(i)=taylor(fx,x,x0,'Order',i);
    tt= function_handle(t(i));
    h(i)=tt(x1);
end
for i=1:n
    y=char(t(i));
    imp=sprintf('%4.0f , %s , %10.6f \n', i,y,h(i));
    disp(imp);
end
disp('    ');
serie =taylor(fx,x,x0,'Order',n)
disp('    ');
disp('* Serie de Taylor solicitada:')
fprintf('* Valor: %10.6f', h(n));
disp('  ');disp('  ');
fprintf('* Valor verdadero de la funci�n: %10.6f',fx(x1));fprintf('\n');
%
% C�lculo del error verdadero;
disp('  ');
fprintf('* Error verdadero: %12.8f',abs(fx(x1)-h(n)));fprintf('\n');
%
% C�lculo del error de truncamiento;
%cent=0;
df=function_handle(diff(f,n));
trunc=(abs(x1-x0)^(n)/factorial(n))*abs(df(x1));
trunc1=(abs(x1-x0)^(n)/factorial(n))*abs(df(x0));
disp(' ')
fprintf('* Error de truncamiento x : %12.8f',trunc);fprintf('\n');
fprintf('* Error de truncamiento x0: %12.8f',trunc1);fprintf('\n'); 
disp(' ')
disp('**** Si la funci�n es un polinomio, considerar que para')
disp('el error de truncamiento se podr�a tener una derivada constante.')
disp('Por lo que hay que tener cuidado con este c�lculo.')
