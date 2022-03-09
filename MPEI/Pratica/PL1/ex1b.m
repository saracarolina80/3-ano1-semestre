%% Codigo 1 - segunda versao

N= 1e5;         %numero de experiencias
p = 0.5;        %probabilidade de cara
k = 2;          %numero de caras
n = 3;          %numero de lancamentos

lancamentos = rand(n,N) > p;
sucessos= sum(lancamentos)==k;
probSimulacao= sum(sucessos)/N