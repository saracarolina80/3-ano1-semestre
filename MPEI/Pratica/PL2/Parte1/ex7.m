% Guião PL2 --> 2.1 

% Exercicíco 7 
N = 1000000;
m = 100;
pa = 0.01;
pb = 0.05;
pc = 0.001;
programas = [ones(1,20) 2*ones(1,30) 3*ones(1,50)]; %André- 1, Bruno- 2, Carlos- 3

aux = randi(m,1, N);
prog_escolhidos = programas(aux);
aleat = rand(1,N);
erros = zeros(1,N);

for k=1:N
    if prog_escolhidos(k) == 1
        erros(k) = aleat(k) < pa;
    elseif prog_escolhidos(k) == 2
        erros(k) = aleat(k) < pb;
    else
        erros(k) = aleat(k) < pc;
    end
end
prob_erro = sum(erros)/N
prob_erro_carlos = sum(erros & prog_escolhidos == 3)/N;
prob_carlos_sabendo_que_tem_erro = prob_erro_carlos/prob_erro
prog_escolhidos