% Metodo de Newton-Raphson sist. de 2 ecs. no lineales
%
warning('off','all');
clear;
pkg load symbolic
syms x1 x2
clc
%
%  Funciones a procesar
funx1=input('Introduce la primera función con respecto a x1, x2: ');
disp(' ');
funx2=input('Introduce la segunda función con respecto a x1, x2: ');
funx1=function_handle(funx1,'vars',[x1,x2]);
funx2=function_handle(funx2,'vars',[x1,x2]);
%funx1=strcat('@(x1,x2)',funx1); funx1=str2func(funx1); 
%funx2=strcat('@(x1,x2)',funx2); funx2=str2func(funx2);
%
%  Calcula las derivadas parciales y las convierte a funciones;;
syms fun11 fun12 fun21 fun22;
fun11=diff(funx1,x1); fun11=function_handle(fun11,'vars',[x1,x2]);
fun12=diff(funx1,x2); fun12=function_handle(fun12,'vars',[x1,x2]);
fun21=diff(funx2,x1); fun21=function_handle(fun21,'vars',[x1,x2]);
fun22=diff(funx2,x2); fun22=function_handle(fun22,'vars',[x1,x2]);
%
disp(' ');
disp('Método de Newton-Raphson para ecuaciones no lineales.');
disp(' ');
temp='';
nf=2;
% Inicializa matrices;
f=zeros(nf,1);  % vector columna de las funciones;
ff=zeros(nf,nf);  % matriz de las derivadas parciales;
x=zeros(nf,1);  % vector columna de las variables x's;
h=zeros(nf,1);  % vector columna de las incrementos de x's = h's;
disp(' ');
disp('Valores iniciales');
x(1,1)=input('x1 = ');
x(2,1)=input('x2 = ');
%
tol=input('Tolerancia = ');
niter=input('Iteraciones = ');
disp('  ');disp('  ');
f(1,1)=-funx1(x(1,1),x(2,1));  % cuantifica las funciones;
f(2,1)=-funx2(x(1,1),x(2,1));
%
ff(1,1)=fun11(x(1,1),x(2,1));  % cuantifica las derivadas parciales;
ff(1,2)=fun12(x(1,1),x(2,1));
ff(2,1)=fun21(x(1,1),x(2,1));
ff(2,2)=fun22(x(1,1),x(2,1));
%
disp('Jacobiano:'); disp(ff);
disp('Determinante del Jacobiano');disp(det(ff));
disp('Inversa del Jacobiano');disp(inv(ff));
temp=input('','s');
disp(' ');disp(' ');
disp('   k      x1,k       x2,k      -f1,k       -f2,k      f11,k      f12,k      f21,k      f22,k      h1,k      h2,k');
iter=0;
while (iter<=niter)
    h=ff\f;  % calcula el vector h;
    fprintf('%5.0f %10.6f %10.6f %10.6f %10.6f %10.6f %10.6f %10.6f %10.6f %10.6f %10.6f %10.6f %10.6f', iter,x(1,1),x(2,1),f(1,1),f(2,1),ff(1,1),ff(1,2),ff(2,1),ff(2,2),h(1,1),h(2,1));fprintf('\n');
    temp=input('','s');
    x(1,1)=x(1,1)+h(1,1); % calcula las siguientes x's;
    x(2,1)=x(2,1)+h(2,1);
    f(1,1)=-funx1(x(1,1),x(2,1)); % calcula las siguientes funciones;
    f(2,1)=-funx2(x(1,1),x(2,1));
    ff(1,1)=fun11(x(1,1),x(2,1)); % calcula las siguientes derivadas parciales;
    ff(1,2)=fun12(x(1,1),x(2,1));
    ff(2,1)=fun21(x(1,1),x(2,1));
    ff(2,2)=fun22(x(1,1),x(2,1));
    iter=iter+1;
    if (abs(h(1,1))<tol)&&(abs(h(2,1))<tol)
        fprintf('%5.0f %10.6f %10.6f \n', iter,x(1,1),x(2,1));
        fprintf('\n Raíces: %10.6f %10.6f \n',x(1,1),x(2,1))
        break;
    end
end



