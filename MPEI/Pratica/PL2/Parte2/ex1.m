% Guião PL2 --> 2.2 

% Exercicíco 1 

lados = 6;
dados = 1;
N = 1e4;

px = floor(rand(dados,N) * (lados+1));

%Função probabilidade massa
prob = [sum(px==1)/N, sum(px==2)/N, sum(px==3)/N, sum(px==4)/N, sum(px==5)/N, sum(px==6)/N];
stem(1:6, prob)

hold on

%Função distribuição acumulada
acum = [0 cumsum(prob)];

stairs(0:6, acum)
hold off
