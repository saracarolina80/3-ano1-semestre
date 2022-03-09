%  probabilidade de obter 6 caras em 15 lancamentos de uma moeda equilibrada

N = 1e5;
p = 0.5;
k = 6;
n = 15;

lancamentos = rand(n , N) > p;
sucessos= sum(lancamentos)==k;
probSimulacao = sum(sucessos) / N
