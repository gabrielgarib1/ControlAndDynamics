clc
clear
close
load('exp_pendulo.mat');
%% Gráficos

y=zeros(size(vTime));
phi=zeros(size(vTime));

for i=2:length(vTime)-1

y(i)=[y(i)];
y(i+1)=[vTheta(i+1)];
phi(i)=[phi(i)];
vTheta(i);vTheta(i-1);sin(vTheta(i-1));vF(i-1)];

end

results=inv(transpose(phi)*transpose(phi))*phi*y;
% subplot(3,1,1);
% 
% plot(vTime,vTheta)
% grid
% xlabel('tempo [s]')
% ylabel('Ângulo [rad]')
% 
% subplot(3,1,2);
% 
% plot(vTime,vF)
% grid
% xlabel('tempo [s]')
% ylabel('Força [N]')
% 
% 
% 
% 
% 
% 
% 
