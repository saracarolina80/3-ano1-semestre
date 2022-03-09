% Guião PL2 --> 2.2 

% Exercicíco 2

% a)
% E = {5, 50, 100}
% p(5) = 90/100
% p(50) = 9/100
% p(100) = 1/100

%b)
% Matriz com todos os resultados
cinco_eur=ones(1,90)*5;
cinquenta_eur=ones(1,9)*50;
cem_eur=ones(1,1)*100;
total=[cinco_eur,cinquenta_eur,cem_eur];

N = 100;
%Função probabilidade massa
X = [sum(total==5)/N, sum(total==50)/N, sum(total==100)/N];
stem([5 50 100], X);
hold on

% c)
%Função distribuição acumulada
acum = [0 cumsum(X)];
stem([0 5 50 100], acum);
hold off
