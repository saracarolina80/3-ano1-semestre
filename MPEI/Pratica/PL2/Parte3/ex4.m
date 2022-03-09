% Guião PL2 --> 2.3 

% Exercicio 4

%p1 = 0,2% componentes 1 com defeito
%p2 = 0,5% componentes 2 com defeito
%Um brinquedo está com defeito se pelo menos uma das componentes tiver
%defeito
%pa = 0,1% processo de montagem com defeito

clc

%4.
N = 1e4;
n = 20;
p1 = 0.002;
p2 = 0.005;
pa = 0.001;

%a)
resultados = zeros(n,N);
for i=1:N
    defeitos = rand(3,n);

    for j=1:n
        if (defeitos(1,j) < p1 || defeitos(2,j) < p2 || defeitos(3,j) < pa)
            resultados(j,i) = 1;
        end
    end
end

teste = 0;
for i=1:N
    t = randperm(n,1);
    if resultados(t,i) == 1
       teste = teste + 1;
    end
end

prob = 1 - (teste/N);

fprintf("a) A probabilidade da caixa ser comercializada quando m = 1 é de %.4f\n", prob); 

%b)
prob= 1:19;
z = 1:19;

for k=1:19
    z(k)=k;
end

for k=1:19
    resultados = zeros(n,N);
    for i=1:N
        defeitos = rand(3,n);

        for j=1:n
            if (defeitos(1,j) < p1 || defeitos(2,j) < p2 || defeitos(3,j) < pa)
                resultados(j,i) = 1;
            end
        end
    end
    defeito = sum(resultados);
    teste = 0;  

    for i=1:N
        t = randperm(n,k);
        if resultados(t,i) == 1
           teste = teste + 1;
        end
        if resultados(t,i) == 0
            if defeito(i) ~= 0
                teste = teste + 1;
            end
        end

    end

    prob(k) = 1 - (teste/N);
end

fprintf("b) Figure 1: O menor valor de m necessário para atingir o objetivo desejado é 7\n");

stem(z,prob)