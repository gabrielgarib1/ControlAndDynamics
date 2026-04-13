%% Condições iniciais

v0 = 0; %[m/s] velocidade

%% Simulação

uStep = 100*g; %[N] amplitude do degrau na força motriz
simTime = 1*80; %[s] tempo de simulação
Ts = 0.1; %[s] intervalo de amostragem para resultados

sim('diagMA') % executa simulação no Simulink

%% Resultados

figure
set(gcf,'name','Velocidade')
plot(v.Time,v.Data*3.6)
return
grid on
xlabel('tempo [s]')
ylabel('velocidade [km/h]')

figure
set(gcf,'name','Aceleração')
plot(v_p.Time,v_p.Data*3.6)
grid on
xlabel('tempo [s]')
ylabel('aceleração [(km/h)/s]')