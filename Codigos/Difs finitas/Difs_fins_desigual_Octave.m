% Aproximaciones finitas;
%
clear;clc;
warning('off','all');
disp('*** Diferencias Finitas desigualmente espaciadas ***.');
disp('  ');disp('  ');
x0=input('x0: ');fx0=input('f(x0): ');disp('  ');
x1=input('x1: ');fx1=input('f(x1): ');disp('  ');
x2=input('x2: ');fx2=input('f(x2): ');disp('  ');
x=input('Valor de x donde quieres evaluar la derivada: ');disp('  ');
sol = fx0*(2*x-x1-x2)/((x0-x1)*(x0-x2))+fx1*(2*x-x0-x2)/((x1-x0)*(x1-x2))+fx2*(2*x-x0-x1)/((x2-x0)*(x2-x1));
fprintf('%10.6f \n',sol)