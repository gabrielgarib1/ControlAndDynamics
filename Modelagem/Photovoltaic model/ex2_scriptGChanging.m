
clc
clear
close

%% Conversor Buck
r = 1; % resistência de carga (sem célula fotovoltaica) [ohm]
l = 10^(-3); % indutância[H]
c = 800 * 10^(-6); % capacitância [F]
fs = 2 * 10^3; % frequência de chaveamento do sinal PWM [Hz]

%% Célula fotovoltaica
rp = 38.17; % [ohm]
rs = 61.3 *10^(-3); % [ohm]
a = 1.7538; % Fator de idealidade do Diodo
isn = 5.68 * 10^(-6); % corrente de saturação nominal do diodo [A]
q = 1.602 *10^(-19); % Carga do elétron [C] 
k = 1.38*10^(-23); % Constante de Boltzmann dos gases perfeitos [J/K]
vgo = 1.1; % band gap voltage [eV] , correto pois vgo * q = [J]
iscn = 3.1656; % Corrente de curto-circuito nominal [A]
gn= 1000; % Irradiação solar nominal [W / m²]
tn = 273.15 + 25; % Teperatura nominal da célula fotovoltaica [K] 
ki = 1.8 * 10^(-3); %coeficiente de temperatura da corrente de curto-circuito [A / K]

%% Parametros Q2
% g=[gn,gn,gn];
% t=273.15 +  [0 ,    + 25,   + 60];
g=[200,500,1000];
t=[tn,tn,tn];
%% Configuração de subplots
colors=['b','r','g'];
% legendas = {'T = 0°C', 'T = 25°C', 'T = 60°C'};
legendas = {'G = 200 W/m²', 'G = 500 W/m²', 'G = 1000 W/m²'};

figure;
% Subplot I-V
subplot(2,1,1);
hold on; grid on;
title('Curva I-V');
xlabel('Tensão (V)');
ylabel('Corrente (A)');

% Subplot P-V
subplot(2,1,2);
hold on; grid on;
title('Curva P-V');
xlabel('Tensão (V)');
ylabel('Potência (W)');

%% Loop para cada temperatura

for index=1:length(t)


%Funções não transcedentais
ipv= g(index)/gn * (iscn+ki*(t(index)-tn));
is= isn*(t(index)/tn)^3*exp(q*vgo/(a*k)*(1/tn - 1/t(index))); %Corrente de saturação do diodo
vt=k*t(index)/q; %Tensão térmica[V]


%Faixa de tensões para análise
V = linspace(0, 10, 100);  % Tensão de 0 a 10 V

I = zeros(size(V));        % Inicializar vetor de corrente

%% Resolver numericamente para I em cada V usando fzero
for index2 = 1:length(V)

    fun = @(I) ipv - is * (exp((V(index2) + rs*I)/(vt*a)) - 1) - (V(index2) + rs*I)/rp - I;

    I(index2) = fzero(fun, ipv/2) *3; 

end

P = 33*V .* I;  % Potência

upperlimit = 100;
% Plotar curvas
subplot(2,1,1);
    plot(V, I, colors(index), 'LineWidth', 2);
    ylim([-10 15]);
    subplot(2,1,2);
    plot(V, P, colors(index), 'LineWidth', 2);
    ylim([-50 100]);

end


%% Adiciona legendas
subplot(2,1,1);
legend(legendas, 'Location', 'southwest');

subplot(2,1,2);
legend(legendas, 'Location', 'northwest');

