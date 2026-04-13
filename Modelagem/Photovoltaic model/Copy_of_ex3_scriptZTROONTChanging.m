clc
clear
close all

%% Dados
r = 1; l = 10^(-3); c = 800e-6; fs = 2e3;
q = 1.602e-19; k = 1.38e-23;
vgo = 1.1; iscn = 9.02; gn=1000; tn = 298.15;
ki = 1.8e-3;
g=1000; t=298.15;
ipv = g/gn * (iscn + ki*(t-tn));
vt = k*t/q;
Pmax=160; Imaxpot=8.2; Vmaxpot=19.57; % Corrigido Pmax = 160

%% Função objetivo
fun = @(x) objetivo(x, ipv, t, tn, q, vgo, k, Vmaxpot, Imaxpot, vt);

%% Configuração otimização
x0=[38.17; 6.1e-3; 1.7538; 5.68e-6];
lb=[1e-6 1e-6 0.5 1e-10];
ub=[];
options = optimoptions('fmincon','Display','iter','Algorithm','sqp');

%% Chamada
res = fmincon(fun,x0,[],[],[],[],lb,ub,[],options);

%% Função separada
function f = objetivo(x, ipv, t, tn, q, vgo, k, Vmaxpot, Imaxpot, vt)
    expoente1 = q*vgo/(x(3)*k)*(1/tn - 1/t);
    expoente2 = (Vmaxpot + x(1)*Imaxpot)/(vt*x(3));
    % Protege para não explodir:
    if expoente1 > 10000000000, expoente1 = 10000000000; end
    if expoente2 > 700, expoente2 = 700; end
    termo1 = x(4)*(t/tn)^3 * exp(expoente1);
    termo2 = (exp(expoente2) - 1);
    f = abs(ipv - termo1 * termo2 - (Vmaxpot + x(1)*Imaxpot)/x(2) - Imaxpot);
end
