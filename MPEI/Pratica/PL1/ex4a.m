
p = 0.5; %probabilidade
n = 3; %numero de lancamentos
K = 2; %numero de caras pretendidas
N = 1e5; %numero de experiencias a realizar

probSim = probKCarasNLancamentos(N, k, n);


function y = probKCarasNLancamentos(N, k, n)
    lancamentos = rand(n, N) > 0.5;
    sucessos = sum(lancamentos) == k;
    y = sum(sucessos)/N;
end