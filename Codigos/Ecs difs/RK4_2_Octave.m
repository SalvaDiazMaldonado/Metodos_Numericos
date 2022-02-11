% Runge-Kutta para una ec. dif.
% Octubre del 2017
%
clear;clc;
warning off MATLAB:divideByZero
warning off MATLAB:dispatcher:InexactMatch
%
disp('Método de Runge-Kutta de cuarto orden.');
disp('  ');
fy=input('Introduce la función y=f1(t,y,v)  ','s');
fy=strcat('@(t,y,v)',fy); fy=str2func(fy);
disp(' ');
fv=input('Introduce la función v=f2(t,y,v)  ','s');
fv=strcat('@(t,y,v)',fv); fv=str2func(fv);
disp(' ');
%  Lectura de datos
%
disp('Datos:');disp('  ');
t0=input('t0 = ');
tn=input('tn = ');
y0=input('y0 = ');
v0=input('v0 = ');
dt=input('Incremento de t = ');
ndt=(tn-t0)/dt;
t = [t0:dt:tn]; 
n = length(t); 
y = zeros(1,n); 
v=y;
y(1) = y0;
v(1) = v0;
disp('  ');disp('  ');
disp('  i       t(i)         y(i)         v(i)        k1           k2           k3           k4           l1           l2           l3           l4')
for i = 1:ndt
    k1 = fy(t(i),y(i),v(i));
    l1 = fv(t(i),y(i),v(i));
    k2 = fy(t(i)+dt/2,y(i)+dt*k1/2,v(i)+dt*l1/2);
    l2 = fv(t(i)+dt/2,y(i)+dt*k1/2,v(i)+dt*l1/2);
    k3 = fy(t(i)+dt/2,y(i)+dt*k2/2,v(i)+dt*l2/2);
    l3 = fv(t(i)+dt/2,y(i)+dt*k2/2,v(i)+dt*l2/2);
    k4 = fy(t(i)+dt,y(i)+dt*k3,v(i)+dt*l3);
    l4 = fv(t(i)+dt,y(i)+dt*k3,v(i)+dt*l3);
    y(i+1) = y(i)+dt*(k1+2*k2+2*k3+k4)/6;
    v(i+1) = v(i)+dt*(l1+2*l2+2*l3+l4)/6;
    fprintf('%4.0f %12.6f %12.6f %12.6f %12.6f %12.6f %12.6f %12.6f %12.6f %12.6f %12.6f %12.6f',i-1,t(i),y(i),v(i),k1,k2,k3,k4,l1,l2,l3,l4);fprintf('\n');
    %fprintf('%4.0f %12.0f %12.0f %12.0f %12.6f %12.6f %12.6f %12.6f %12.6f %12.6f %12.6f %12.6f',i-1,t(i),y(i),v(i),k1,k2,k3,k4,l1,l2,l3,l4);fprintf('\r');
end
fprintf('%4.0f %12.6f %12.6f %12.6f',i+1,t(i+1),y(i+1),v(i+1));fprintf('\n');



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




%ax1=subplot(2,1,1);
%ax2=subplot(2,1,2);
%plot(ax1,t,y,'-.b');
%title(ax1,'Sol. numérica, y(t)')
%plot(ax2,t,v,'-.b');
%title(ax2,'Sol. numérica, v(t)')
%grid(ax1,'on');grid(ax2,'on');
