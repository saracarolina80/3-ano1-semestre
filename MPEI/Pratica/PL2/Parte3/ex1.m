% Guião PL2 --> 2.3 

% Exercicio 1

%p1 = 0,2% componentes 1 com defeito
%p2 = 0,5% componentes 2 com defeito
%Um brinquedo está com defeito se pelo menos uma das componentes tiver
%defeito
%pa = 1% processo de montagem com defeito

clc

%1.
fprintf("A - uma caixa de brinquedos tem pelo menos 1 brinquedo com defeito\n");

N = 1e6;
n = 1;
p1 = 0.002;
p2 = 0.005;
pa = 0.01;

%a)

resultados = zeros(1,N);

for i=1:N
    defeitos = rand(3,n);
    
    for j=1:n
        if (defeitos(1,j) < p1 || defeitos(2,j) < p2 || defeitos(3,j) < pa)
            resultados(1,i) = 1;
        end
    end
end

prob = sum(resultados)/N;
fprintf("a) A probabilidade do evento A quando n=8 é %.4f \n", prob);

%b)

resultados = zeros(1,N);
resultados_t = zeros(1,N);

for i=1:N
    defeitos = rand(3,n);
    
    for j=1:n
        %defeitos devido apenas ao processo de montagem
        if ((defeitos(1,j) > p1 && defeitos(2,j) > p2) && defeitos(3,j) < pa)
            resultados(1,i) = resultados(1,i)+1;
        end
        %todos as caixas que têm brinquedos com defeitos
        if (defeitos(1,j) < p1 || defeitos(2,j) < p2 || defeitos(3,j) < pa)
            resultados_t(1,i) = 1;
        end
        
    end
end

erros_pa = sum(resultados);
erros_t = sum(resultados_t);
res = erros_pa/erros_t;

fprintf("b) O número médio de brinquedos defeituosos devido ao processo de montagem quando ocorre o evento A é %.4f \n", res);


