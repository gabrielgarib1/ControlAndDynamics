
clc
clear
close

%% Parametrização inicial

m = 1001; %[kg] massa do veículo
cd = 0.373; %[-] coeficiente de arrasto adimensioal
A = 2.04; %[m^2] área frontal
rho = 1.29; %[kg/m^3] densidade do ar

c = 0.5*rho*A*cd; %[(m/s)^2] coeficiente de arrasto

g = 9.82; %[m/s^2] aceleração da gravidade
Pmax = 54426.9; %[W] potência máxima
Vmax = 167/3.6; %[m/s] velocidade máxima
Fmax = Pmax/Vmax; %[N] força na velocidade máxima


freq_ang_rota=2*pi/500;
%% Ajuste do atrito viscoso

b = (Fmax - c*Vmax^2)/Vmax;

%% Simulação

ataca = sim('sim_car_model3');

v = ataca.v.Data;
t = ataca.v.Time;
F = ataca.F.Data;
incl = ataca.inclin.Data;
vref = ataca.vref_km_h.Data;
vref_vec = ones(size(v)) * vref;

%% Gráficos

% Velocidades
subplot(3,1,1);

plot(t,v*3.6)
grid
xlabel('tempo [s]')
ylabel('velocidade [km/h]')

hold

plot(t,vref_vec,'--')
legend('saída','referência')



subplot(3,1,2);

plot(t,F)
grid
xlabel('tempo [s]')
ylabel('força motriz [N]')


subplot(3,1,3);

plot(t,incl*180/pi)
grid
xlabel('tempo [s]')
ylabel('Inclinação [Graus]')

%carro modelado: GOL 1.0 2020 a Gasolina


