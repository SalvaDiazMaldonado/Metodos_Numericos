% Método de Euler para resolver dos EDO;
%
clc;  clear;
warning off MATLAB:divideByZero
warning off MATLAB:dispatcher:InexactMatch
%set(0, "defaulttextfontsize", 18) % title
%set(0, "defaultaxesfontsize", 18) % axes labels
%  Dos ecuaciones diferenciales
%
pkg load symbolic
syms t y v
disp('Método de Euler.');

disp('  ');
fy=input('Introduce la función y=f1(t,y,v)  ','s');
fy=strcat('@(t,y,v)',fy); fy=str2func(fy);
disp(' ');
fv=input('Introduce la función v=f2(t,y,v)  ','s');
fv=strcat('@(t,y,v)',fv); fv=str2func(fv);
disp(' ');






%disp('  ');
%fy=input('Introduce la función y=f1(t,y,v)  ');
%fy=strcat('@(t,y,v)',fy); fy=str2func(fy);
%fy = function_handle(fy);
%disp(' ');
%fv=input('Introduce la función v=f2(t,y,v)  ','s');
%fv=strcat('@(t,y,v)',fv); fv=str2func(fv);
%disp(' ');







%  Lectura de datos
%
disp('Datos:');disp('  ');
t0=input('t0 = ');
tn=input('tn = ');
y0=input('y0 = ');
v0=input('v0 = ');
dt=input('Incremento de t = ');
disp('  ');disp('  ');
disp('    i       t(i)        y(i)       v(i)');
ndt=(tn-t0)/dt;
t = [t0:dt:tn]; 
n = length(t); 
y = zeros(1,n);
v=y;
ye=y;
ve=y;
yy = zeros(1,n);
vv=yy;
y(1) = y0;
v(1)=v0;
ye(1) = y0;
ve(1)=v0;
iter=0;
for i = 1:ndt
    fprintf('%4.0f %12.4f %12.6f %12.6f',i-1,t(i),y(i),v(i));fprintf('\n');
    iter = iter + 1;
    y(i+1) = y(i) + dt * fy(t(i), y(i), v(i));
    v(i+1) = v(i) + dt * fv(t(i), y(i), v(i));
end
fprintf('%4.0f %12.4f %12.6f %12.6f',i,t(i+1),y(i+1),v(i+1));fprintf('\n');

clf;
hold on
[hax, h1, h2] = plotyy (t, y, t, v);
set ([h2], "linestyle", "--");
xlabel (hax(1), "t");
ylabel (hax(1), "y")
ylabel (hax(2), "v")
grid
legend("y", "v",'location','southeast')
hold off





%fprintf('%4.0f %12.4f %12.6f %12.6f',i,t(i+1),y(i+1),v(i+1));fprintf('\n');
%ax1=subplot(2,1,1);
%ax2=subplot(2,1,2);
%plot(ax1,t,y,'-.b');
%title(ax1,'Sol. numérica, y(t)')
%plot(ax2,t,v,'-.b');
%title(ax2,'Sol. numérica, v(t)')
%grid(ax1,'on');grid(ax2,'on');
