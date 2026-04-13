clc
clear all
close all

l = 3; %[m] comprimento da haste
m = 1; %[kg] massa pontual na extremidade da haste
g = 9.8; %[m/s^2] aceleração da gravidade
b = 1.2; %[Nm/(rad/s)] coeficiente de atrito viscoso

Q = 4; %[Nm] torque de entrada

%tVec = linspace(0,10,50);
tEnd = 20; %[s] end simulation time

x10 = [pi/2;0];
%x1Vec = lsode(@(x,tVec) funDin(l,m,b,g,x,Q),x10,tVec);
[tVec1,x1Vec] = ode45 (@(t,x) funDin(l,m,b,g,x,Q), [0 tEnd], x10);
x20 = [l;0;0;0];
%x2Vec = lsode(@(x,tVec) funDinCar(l,m,b,g,x,Q),x20,tVec);
[tVec2,x2Vec] = ode45 (@(t,x) funDinCar(l,m,b,g,x,Q), [0 tEnd], x20);

figure
plot(tVec1,x1Vec(:,1)*180/pi)
hold on
plot(tVec2,asin(x2Vec(:,1)/l)*180/pi)
grid on
xlabel('time [s]','interpreter','latex')
ylabel('\theta [deg]')
legend('polar','cartesian')