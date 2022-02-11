% Series de Taylor
% Marzo 2018
%
% aceleradores de gráficas;
% clear all
warning('off','all');
pkg load symbolic
clc
disp('** Este programa determina la serie de Taylor, simbólica y')
disp('   numéricamente, de una función f(x)suministrada por pantalla **')
disp('  ')
syms x
f=input('Introduce una función con respecto a x   ');
fx=function_handle(f);
x0=input('Expandir alrededor de x0 = ? ');
if (x0==0)
  disp('  ')
  disp('***  Serie de Maclaurin ***')
  disp('  ')
endif
x1=input('Determinar en x          = ? ');
n=input('Número de términos de la serie de Taylor = ? ');  % Número de términos de la serie de Taylor 'Order'
t = sym('t', [1 n]);
h=zeros(n,1);
disp('  '); disp('  ');
disp('Términos,  Serie  y su valor');
disp('  ');
for i=1:n   % Calcula el número de términos de la serie de Taylor
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
fprintf('* Valor verdadero de la función: %10.6f',fx(x1));fprintf('\n');
%
% Cálculo del error verdadero;
disp('  ');
fprintf('* Error verdadero: %12.8f',abs(fx(x1)-h(n)));fprintf('\n');
%

% Cálculo del error de truncamiento;
cent=0;
df=function_handle(diff(f,n));
if (abs(df(x1))==0)
  disp('  ');
  disp('Debido a que la derivada de mayor orden de la serie de Taylor')
  disp(' es igual a 0, el error de truncamiento se calcula en n=n-1')
  disp('  ');
  n = n-1;
  cent=1;
  df=function_handle(diff(f,n));
endif
trunc=(abs(x1-x0)^(n)/factorial(n))*abs(df(x1));
trunc1=(abs(x1-x0)^(n)/factorial(n))*abs(df(x0));
disp(' ')
fprintf('* Error de truncamiento x : %12.8f',trunc);fprintf('\n');
fprintf('* Error de truncamiento x0: %12.8f',trunc1);fprintf('\n'); 
  
  
%if (abs(df(x1))>0)
%  trunc=(abs(x1-x0)^(n)/factorial(n))*abs(df(x1));
%  trunc1=(abs(x1-x0)^(n)/factorial(n))*abs(df(x0));
%else 
%  df=function_handle(diff(f,n-1));
%  trunc=(abs(x1-x0)^(n-1)/factorial(n-1))*abs(df(x1));
%  trunc1=(abs(x1-x0)^(n-1)/factorial(n-1))*abs(df(x0));
%endif
