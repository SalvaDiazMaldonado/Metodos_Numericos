% Integración por Simpson 2017;
%
clc; clear all;
warning('off','all');
pkg load symbolic
%
syms x
disp('*** Regla de Simpson ***.');disp('  ');
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
%
disp(' ');
if  rem(np,2)==0  %número par de paneles
    disp('*** Regla de Simpson sin corrección ***.');disp('  ');
    for i=0:np
        fprintf('%6.0f  %10.6f   %10.6f \n',i,li+i*h,f(li+i*h));
    endfor
    f0=f(li);
    fn=f(ls);
    sumapar=0;
    sumaimpar=0;
    for i=2:2:np-2
        sumapar=sumapar+f(li+i*h);
    end
    for i=1:2:np-1
        sumaimpar=sumaimpar+f(li+i*h);
    end
    I=(h/3)*(f0+fn+4*sumaimpar+2*sumapar);
    fprintf('suma par: %10.6f   suma impar: %10.6f\n',sumapar,sumaimpar);
    disp('   ');
    fprintf('  I = %10.6f \n', I)
    %
    disp('   ');disp('   ');
    pause
    disp('*** Regla de Simpson con corrección ***.');disp('  ');
    fprintf('f´(a) = %10.6f   f´(b) = %10.6f \n',g(li),g(ls));
    disp('  ');
    I=(h/15)*(14*(0.5*(f0+fn)+sumapar)+16*sumaimpar+h*(g(li)-g(ls)));
    fprintf('  I = %10.6f \n', I)
    %
else% número impar de paneles
    % 
    f0=f(li);
    fn=f(ls-3*h);
    sumapar=0;
    sumaimpar=0;
    for i=2:2:np-5
        sumapar=sumapar+f(li+i*h);
    end
    for i=1:2:np-3
        sumaimpar=sumaimpar+f(li+i*h);
    end
    I=(h/3)*(f0+fn+4*sumaimpar+2*sumapar);
    %
    disp('   ');disp('   ');
    disp('*** Regla de Simpson 3/8 ***.');disp('  ');
    for i=0:np-3
        fprintf('%6.0f  %10.6f   %10.6f \n',i,i*h,f(li+i*h));
    end
    disp('  ');
    % Simpson 3/8
    for i=np-3:np
        fprintf('%6.0f  %10.6f   %10.6f \n',i,i*h,f(li+i*h));
    end
    disp('   ');
    II=((ls-(ls-3*h))/8)*(f(ls-3*h)+3*f(ls-2*h)+3*f(ls-h)+f(ls));
    %
    disp('   ');
    fprintf('  I = %10.6f \n', I+II)   
end
    
