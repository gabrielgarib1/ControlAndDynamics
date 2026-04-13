close all
clc

u = 200*g; %[N] amplitude do degrau na força motriz

veqMax = fzero(@(v) funEq(b,c,m,g,alpha,u,v),5); %[m/s] equilíbrio não linear

%valor de 'b' do modelo linear para o equilíbrio no ponto máximo seja igual
%ao do modelo não linear
bLin = (u - m*g*sin(alpha))/veqMax; %[N/(m/s)]

uVec = m*g*sin(alpha):0.1:200*g;
veqVec = zeros(size(uVec));
veqLinVec = zeros(size(uVec));

for i=1:length(uVec)
    u = uVec(i);
    veqVec(i) = fzero(@(v) funEq(b,c,m,g,alpha,u,v),5);
    veqLinVec(i) = (u- m*g*sin(alpha))/bLin;
end

figure
set(gcf,'OuterPosition',[2*figWidth figHeight figWidth figHeight]);
set(gcf,'name','equilíbrio')
plot(uVec/g,veqVec*3.6)
grid on
hold on
plot(uVec/g,veqLinVec*3.6)
xlabel('força motriz [kgf]')
ylabel('velocidade [km/h]')
legend('não linear','linear')