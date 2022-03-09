% Guião PL2 --> 2.3 

% Exercicio 2

%p1 = 0,2% componentes 1 com defeito
%p2 = 0,5% componentes 2 com defeito
%Um brinquedo está com defeito se pelo menos uma das componentes tiver
%defeito
%pa = 1% processo de montagem com defeito

clc

%2.
fprintf("B - uma caixa de brinquedos não tem brinquedos com defeito\n");
N = 1e6;
n = 8;
p1 = 0.002;
p2 = 0.005;
pa = 0.01;

%a)

resultados = ones(1,N);

for i=1:N
    defeitos = rand(3,n);

    for j=1:n
        if (defeitos(1,j) < p1 || defeitos(2,j) < p2 || defeitos(3,j) < pa)
            resultados(1,i) = 0;
        end
    end
end

prob = sum(resultados)/N;

fprintf("a) A probabilidade do evento B quando n=8 é %.4f \n", prob);

%b)

pb = p2;
pc = pa;
pa = p1;
% P(A && B) = P(A)*P(B);
% 1-P(AUBUC) = 1-( P(AUB)U P(C)) = 1-(P(A+b-ANB)+PC-P(AUB N C)

PAnB = pa * pb;
PAnC = pa * pc;
PBnC = pb * pc;
PAnBnC = pa * pb * pc;


% a+b+c anc anb bnc 
% polinomial (o,8) 
% (o8)(prob)^k(1-prob)^k 
% prob = nchoosek(0,8)*pˆk*(1-p)ˆ(n-k)

prob = (1-(pa + pb + pc - PAnB - PAnC - PBnC + PAnBnC))^8;
% a +b+c -anc -anb -bnc + ancnb
fprintf("b) A probabilidade do evento B (valor teórico) quando n=8 é %.4f \n", prob);

%c)

prob= 2:20;
z = 2:20;

for k=2:20
    z(k)=k;
end

for k=2:20
    resultados = ones(1,N);

    for i=1:N
        defeitos = rand(3,k);

        for j=1:k
            if (defeitos(1,j) < p1 || defeitos(2,j) < p2 || defeitos(3,j) < pa)
                resultados(1,i) = 0;
            end
        end
    end
    prob(k) = sum(resultados)/N;    
end

fprintf("c) Figure 1 \n");

plot(z,prob)

%d) 
fprintf("d) A capacidade máxima da caixa de forma a ter pelo menos 90%% de probabilidade de não ter defeito é 11 brinquedos \n");
