
clc
clear
close

%% Conversor Buck
r = 1; % resistência de carga (sem célula fotovoltaica) [ohm]
l = 10^(-3); % indutância[H]
c = 800 * 10^(-6); % capacitância [F]
fs = 2 * 10^3; % frequência de chaveamento do sinal PWM [Hz]

%% Célula fotovoltaica
% rp = 38.17; % [ohm]
% rs = 61.3 *10^(-3); % [ohm]
% a = 1.7538; % Fator de idealidade do Diodo
% isn = 5.68 * 10^(-6); % corrente de saturação nominal do diodo [A]
q = 1.602 *10^(-19); % Carga do elétron [C] 
k = 1.38*10^(-23); % Constante de Boltzmann dos gases perfeitos [J/K]
vgo = 1.1; % band gap voltage [eV] , correto pois vgo * q = [J]
iscn = 9.02; % Corrente de curto-circuito nominal [A]
gn= 1000; % Irradiação solar nominal [W / m²]
tn = 273.15 + 25; % Teperatura nominal da célula fotovoltaica [K] 
ki = 1.8 * 10^(-3); %coeficiente de temperatura da corrente de curto-circuito [A / K]

%% Parametros Q2
g=1000;
t=273.15 +  25;

%% Configuração de subplots
colors=['b','r','g'];
legenda = 'G = 1kW/m² e T = 25ºC';


% figure;
% % Subplot I-V
% subplot(2,1,1);
% hold on; grid on;
% title('Curva I-V');
% xlabel('Tensão (V)');
% ylabel('Corrente (A)');
% 
% % Subplot P-V
% subplot(2,1,2);
% hold on; grid on;
% title('Curva P-V');
% xlabel('Tensão (V)');
% ylabel('Potência (W)');


%Funções não transcedentais
ipv= g/gn * (iscn+ki*(t-tn));

vt=k*t/q; %Tensão térmica[V]


%Faixa de tensões para análise
vec = linspace(0, 2, 100);  % Tensão de 0 a 25 V

% I = zeros(size(V));        % Inicializar vetor de corrente

Pmax=1600;
Imaxpot=8.2;
Vmaxpot=19.57;

%% Resolver numericamente para I em cada V usando fzero
for index2 = 1:length(vec)
    
    x0=[38.17
        6.1e-3
        1.7538
        5.68e-6];
% x0=[0 0 0 0];

%     x=[ rs
%         rp
%         a
%         isn];


    fun = @(x)ipv - x(4)*(t/tn)^3*exp(q*vgo/(x(3)*k)*(1/tn - 1/t)) * (exp((Vmaxpot + x(1)*Imaxpot)/(vt*x(3))) - 1) - (Vmaxpot + x(1)*Imaxpot)/x(2) - Imaxpot;

    A=[];
    b=[];
    Aeq=[];
    beq=[];
    lb=[0 0 0 0];
    ub=[];
    res = fmincon(fun,x0,A,b,Aeq,beq,lb,ub);
end

% P = V .* I;  % Potência
% 
% % Plotar curvas
% subplot(2,1,1);
%     plot(V, I, 'r', 'LineWidth', 2);
%     ylim([-2 5]);
%     subplot(2,1,2);
%     plot(V, P, 'b ','LineWidth', 2);
%     ylim([-2 5]);
% 
% 
% 
% %% Adiciona legendas
% subplot(2,1,1);
% legend(legenda, 'Location', 'southwest');
% 
% subplot(2,1,2);
% legend(legenda, 'Location', 'northwest');
% 
