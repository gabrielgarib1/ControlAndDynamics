clear all
close all
clc

%% Parâmetros do modelo

m = 1200; %[kg] massa do automóvel
b = 7; %[N/(m/s)] coeficiente de atrito viscoso
g = 9.8; %[m/s^2] aceleração da gravidade
c = 3; %[N/(m/s)^2) coeficiente de arrasto aerodinâmico
alpha = 1*pi/180; %[rad] inclinação do terreno

plot([0 1 2],[0 1 2])