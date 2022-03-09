% Guião PL2 --> 2.3 

% Exercicio 3

%p1 = 0,2% componentes 1 com defeito
%p2 = 0,5% componentes 2 com defeito
%Um brinquedo está com defeito se pelo menos uma das componentes tiver
%defeito
%pa = 1% processo de montagem com defeito

clc

%3.
fprintf("X - número de brinquedos defeituosos numa caixa\n");
N = 5;
n = 8;
p1 = 0.002;
p2 = 0.005;
pa = 0.01;

%a)
teste = zeros(n,N);
for i=1:N
    defeitos = rand(3,n);

    for j=1:n
        if (defeitos(1,j) < p1 || defeitos(2,j) < p2 || defeitos(3,j) < pa)
            teste(j,i) = teste(j,i)+1;
        end
    end
end
% teste
% t = sum(teste)
% t(2)
% t(3)
% t(4)
prob = [sum((sum(teste) == 0))/N, sum((sum(teste) == 1))/N, sum((sum(teste) == 2))/N, sum((sum(teste) == 3))/N, sum((sum(teste) == 4))/N, sum((sum(teste) == 5))/N, sum((sum(teste) == 6))/N, sum((sum(teste) == 7))/N, sum((sum(teste) == 8))/N];
figure(1); stem(0:8, prob)

fprintf("a) Figura 1: podemos verificar que valor para x = 0 se aproxima do valor resultado obtido na questão 2 a)\n"); 

%b)
prob = 0;
for i = 2:n
    prob = prob + sum((sum(teste) == i))/N;
end
%ou :  1 - sum((sum(teste) == 0))/N - sum((sum(teste) == 1))/N
fprintf("b) Probabilidade de uma caixa ter pelo menos 2 brinquedos defeituosos = %.4f\n" , prob);

%c)

%Valor esperado
E = 0; 
for i=0:n
    %somatório[ xi * p(xi) ]
    E = E + (i* sum((sum(teste) == i))/N);
end

%Variância
var = 0;
for i=0:n      
    %somatório[ (xi - E(X))^2 * p(xi) ]            
    var = var + ((i-E)^2 * sum((sum(teste) == i))/N);
end

%Desvio padrão
desvio = sqrt(var);

fprintf("c) Valor esperado = %.4f; Variância = %.4f; Desvio padrão = %.4f\n" , E,var,desvio);

%d)
%Para 16 brinquedos!!! 
n = 16;
fprintf("d)\n");
        %a)
teste = zeros(n,N);
for i=1:N
    defeitos = rand(3,n);

    for j=1:n
        if (defeitos(1,j) < p1 || defeitos(2,j) < p2 || defeitos(3,j) < pa)
            teste(j,i) = teste(j,i)+1;
        end
    end
end

prob = [sum((sum(teste) == 0))/N, sum((sum(teste) == 1))/N, sum((sum(teste) == 2))/N, sum((sum(teste) == 3))/N, sum((sum(teste) == 4))/N, sum((sum(teste) == 5))/N, sum((sum(teste) == 6))/N, sum((sum(teste) == 7))/N, sum((sum(teste) == 8))/N, sum((sum(teste) == 9))/N, sum((sum(teste) == 10))/N, sum((sum(teste) == 11))/N, sum((sum(teste) == 12))/N, sum((sum(teste) == 13))/N, sum((sum(teste) == 14))/N, sum((sum(teste) == 15))/N, sum((sum(teste) == 16))/N];
figure(2); stem(0:16, prob)

fprintf("     a) Figura 2\n"); 

        %b)
prob = 0;
for i = 2:n
    prob = prob + sum((sum(teste) == i))/N;
end

fprintf("     b) Probabilidade de uma caixa ter pelo menos 2 brinquedos defeituosos = %.4f\n" , prob);

        %c)

%Valor esperado
E = 0; 
for i=0:n
    %somatório[ xi * p(xi) ]
    E = E + (i* sum((sum(teste) == i))/N);
end

%Variância
var = 0;
for i=0:n      
    %somatório[ (xi - E(X))^2 * p(xi) ]            
    var = var + ((i-E)^2 * sum((sum(teste) == i))/N);
end

%Desvio padrão
desvio = sqrt(var);

fprintf("     c) Valor esperado = %.4f; Variância = %.4f; Desvio padrão = %.4f\n" , E,var,desvio);


