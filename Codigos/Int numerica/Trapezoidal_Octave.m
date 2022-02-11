% Regla trapezoidal 2017;
%
clc; clear all;
warning('off','all');
%
pkg load symbolic
syms y(x);
disp('*** Regla trapezoidal ***.');disp('  ');
disp('  ');disp('  ');
f=input('Introduce una función con respecto a x   ');
g=diff(f,x);
f=function_handle(f);
g=function_handle(g);
li=input(' Límite inferior = ');
ls =input(' Límite superior = '); disp('   ');
np =input(' Número de paneles = '); disp('   ')
%
h=(ls-li)/np;
disp('*** Regla trapezoidal sin corrección ***.');disp('  ');
f0=f(li);
fn=f(ls);
suma=0;
for i=1:np-1
    suma=suma+f(li+i*h);
end
Isc=(h/2)*(f0+fn+2*suma);
disp('    i      xi           fi');
i=0;
fprintf('%6.0f  %10.6f   %10.6f \n',i,li,f(li));
for i=1:np-1
    fprintf('%6.0f  %10.6f   %10.6f \n',i,li+i*h,f(li+i*h));
end
fprintf('%6.0f  %10.6f   %10.6f \n',i+1,ls,f(ls));
disp('   ');
fprintf('  I = %10.6f \n', Isc)
disp('   ');disp('   ');
pause
disp('*** Regla trapezoidal con corrección ***.');disp('  ');
fprintf('f´(li)=  %10.6f \n',g(li));
fprintf('f´(ls)=  %10.6f \n',g(ls));
disp('   ');
Icc=Isc-(h^2/12)*(g(ls)-g(li));
fprintf('  I = %10.6f \n', Icc)
    
