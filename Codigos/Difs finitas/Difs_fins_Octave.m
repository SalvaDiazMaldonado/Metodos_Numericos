% Aproximaciones finitas;
%
clear;
pkg load symbolic;
clc;
warning('off','all');
disp('*** Diferencias Finitas ***.');
disp('  ');disp('  ');
syms x
fx=input('Introduce una función con respecto a x:   ');
dif1=diff(fx,1); vdif1=function_handle(dif1);
dif2=diff(fx,2); vdif2=function_handle(dif2);
dif3=diff(fx,3); vdif3=function_handle(dif3);
dif4=diff(fx,4); vdif4=function_handle(dif4);
fx = function_handle(fx);
dx=input('   Incremento de x = ');
x =input('                 x = '); disp('   ');
nd =input('¿Hasta qué diferencia quieres calcular (1-4)? '); disp('   ');
disp('  ');
if (nd==1)
  fprintf('Valor analítico:  %10.6f \n',vdif1(x))
end;
if (nd==2)
  fprintf('Valores analíticos:  %10.6f %10.6f \n',vdif1(x),vdif2(x))
end
if (nd==3)
  fprintf('Valores analíticos:  %10.6f %10.6f %10.6f\n',vdif1(x),vdif2(x),vdif3(x))
end
if (nd==4)
  fprintf('Valores analíticos:  %10.6f %10.6f %10.6f %10.6f\n',vdif1(x),vdif2(x),vdif3(x),vdif4(x))
end
disp('  ');disp('  ');
disp('** OPRIME Enter DESPUÉS DEL DESPLIEGUE DE CADA VALOR **');
disp('  ');disp('  ');
disp('* Aproximaciones hacia adelante de primer orden:');
disp('  ');
d1 = (-fx(x)+fx(x+dx))/dx;
if (nd>=2); d2 = (fx(x)-2*fx(x+dx)+fx(x+2*dx))/dx^2;end;
if (nd>=3); d3 = (-fx(x)+3*fx(x+dx)-3*fx(x+2*dx)+fx(x+3*dx))/(dx^3);end;
if (nd==4); d4 = (fx(x)-4*fx(x+dx)+6*fx(x+2*dx)-4*fx(x+3*dx)+fx(x+4*dx))/dx^4;end;
%
if (nd==1);fprintf('%10.6f',d1);end;
if (nd==2);fprintf('%10.6f %10.6f',d1,d2);end;
if (nd==3);fprintf('%10.6f %10.6f %10.6f',d1,d2,d3);end;
if (nd==4);fprintf('%10.6f %10.6f %10.6f %10.6f',d1,d2,d3,d4);end;
temp=input('','s');
disp('  ');disp('  ');
disp('* Aproximaciones hacia atrás de primer orden:');
disp('  ');
d1 = (-fx(x-dx)+fx(x))/dx;
if (nd>=2);d2 = (fx(x-2*dx)-2*fx(x-dx)+fx(x))/dx^2;end;
if (nd>=3);d3 = (-fx(x-3*dx)+3*fx(x-2*dx)-3*fx(x-dx)+fx(x))./dx^3;end;
if (nd==4);d4 = (fx(x-4*dx)-4*fx(x-3*dx)+6*fx(x-2*dx)-4*fx(x-dx)+fx(x))/dx^4;end;
%
if (nd==1);fprintf('%10.6f',d1);end;
if (nd==2);fprintf('%10.6f %10.6f',d1,d2);end;
if (nd==3);fprintf('%10.6f %10.6f %10.6f',d1,d2,d3);end;
if (nd==4);fprintf('%10.6f %10.6f %10.6f %10.6f',d1,d2,d3,d4);end;
temp=input('','s');
disp('  ');disp('  ');
disp('* Aproximaciones hacia adelante de segundo orden:');
disp('  ');
d1 = (-3*fx(x)+4*fx(x+dx)-fx(x+2*dx))/(2*dx);
if (nd>=2);d2 = (2*fx(x)-5*fx(x+dx)+4*fx(x+2*dx)-fx(x+3*dx))/dx^2;end;
if (nd>=3);d3 = (-5*fx(x)+18*fx(x+dx)-24*fx(x+2*dx)+14*fx(x+3*dx)-3*fx(x+4*dx))/(2*dx^3);end;
if (nd==4);d4 = (3*fx(x)-14*fx(x+dx)+26*fx(x+2*dx)-24*fx(x+3*dx)+11*fx(x+4*dx)-2*fx(x+5*dx))/dx^4;end;
%
if (nd==1);fprintf('%10.6f',d1);end;
if (nd==2);fprintf('%10.6f %10.6f',d1,d2);end;
if (nd==3);fprintf('%10.6f %10.6f %10.6f',d1,d2,d3);end;
if (nd==4);fprintf('%10.6f %10.6f %10.6f %10.6f',d1,d2,d3,d4);end;
temp=input('','s');
disp('  ');disp('  ');
disp('* Aproximaciones hacia atrás de segundo orden:');
disp('  ');
d1 = (fx(x-2*dx)-4*fx(x-dx)+3*fx(x))/(2*dx);
if (nd>=2);d2 = (-fx(x-3*dx)+4*fx(x-2*dx)-5*fx(x-dx)+2*fx(x))/dx^2;end;
if (nd>=3);d3 = (3*fx(x-4*dx)-14*fx(x-3*dx)+24*fx(x-2*dx)-18*fx(x-dx)+5*fx(x))/dx^3;end;
if (nd==4);d4 = (-2*fx(x-5*dx)+11*fx(x-4*dx)-24*fx(x-3*dx)+26*fx(x-2*dx)-14*fx(x-dx)+3*fx(x))/dx^4;end;
if (nd==1);fprintf('%10.6f',d1);end;
if (nd==2);fprintf('%10.6f %10.6f',d1,d2);end;
if (nd==3);fprintf('%10.6f %10.6f %10.6f',d1,d2,d3);end;
if (nd==4);fprintf('%10.6f %10.6f %10.6f %10.6f',d1,d2,d3,d4);end;
temp=input('','s');
disp('  ');disp('  ');
disp('* Aproximaciones centrada de segundo orden:');
disp('  ');
d1 = (-fx(x-dx)+fx(x+dx))/(2*dx);
if (nd>=2);d2 = (fx(x-dx)-2*fx(x)+fx(x+dx))/dx^2;end;
if (nd>=3);d3 = (-fx(x-2*dx)+2*fx(x-dx)-2*fx(x+dx)+fx(x+2*dx))/(2*dx^3);end;
if (nd==4);d4 = (fx(x-2*dx)-4*fx(x-dx)+6*fx(x)-4*fx(x+dx)+fx(x+2*dx))/dx^4;end;
if (nd==1);fprintf('%10.6f',d1);end;
if (nd==2);fprintf('%10.6f %10.6f',d1,d2);end;
if (nd==3);fprintf('%10.6f %10.6f %10.6f',d1,d2,d3);end;
if (nd==4);fprintf('%10.6f %10.6f %10.6f %10.6f',d1,d2,d3,d4);end;
temp=input('','s');
disp('  ');disp('  ');
disp('* Aproximaciones centrada de cuarto orden:');
disp('  ');
d1 = (fx(x-2*dx)-8*fx(x-dx)+8*fx(x+dx)-fx(x+2*dx))/(12*dx);
if (nd>=2);d2 = (-fx(x-2*dx)+16*fx(x-dx)-30*fx(x)+16*fx(x+dx)-fx(x+2*dx))/(12*dx^2);end;
if (nd>=3);d3 = (fx(x-3*dx)-8*fx(x-2*dx)+13*fx(x-dx)-13*fx(x+dx)+8*fx(x+2*dx)-fx(x+3*dx))/(8*dx^3);end;
if (nd==4);d4 = (-fx(x-3*dx)+12*fx(x-2*dx)-39*fx(x-dx)+56*fx(x)-39*fx(x+dx)+12*fx(x+2*dx)-fx(x+3*dx))/(6*dx^4);end;
if (nd==1);fprintf('%10.6f \n',d1);end;
if (nd==2);fprintf('%10.6f %10.6f \n',d1,d2);end;
if (nd==3);fprintf('%10.6f %10.6f %10.6f \n',d1,d2,d3);end;
if (nd==4);fprintf('%10.6f %10.6f %10.6f %10.6f \n',d1,d2,d3,d4);end;
% temp=input('','s');


