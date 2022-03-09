

% EXERCÍCIO 1
% Considere um processo aleatório que gera dois números: o primeiro número
% de 1 a 4 (com todos os valores igualmente prováveis) e o segundo número
% de 4 a 8 (com todos os valores também igualmente prováveis).
% Seja X a variável aleatória que representa o segundo número menos o
% primeiro número.
% (a) (3.0 valores) Estime por simulação (usando 10000 simulações) a função
%     massa de probabilidade da variável aleatória X e apresente-a num
%     gráfico do tipo stem.
% (b) (2.0 valores) Com base na função massa de probabilidade estimada,
%     estime o valor esperado, a variância e o desvio padrão da variável
%     aleatória X.
% (c) (2.0 valores) Determine o valor teórico da probabilidade de X ser
%     maior que 3, sabendo que o primeiro número é 2.


display("Ex1: ")
N = 10000;
X1 = randi([1 4] , 1 , N);
X2 = randi([4 8] , 1 , N);
X = X2 - X1 ; % variavel aleatória

% a)
ocorrencias = zeros(1, length(unique(X)));

for i = 1 : N
    ocorrencias(X(i) + 1) = ocorrencias(X(i) + 1) + 1;
end
fX = ocorrencias/N;
X = unique(X);

% stem(X , fX), xlabel('X') , ylabel('fX');


% 1B

% valor esperado = média 
media = sum(fX.*X)
valor_esperado = sum(X.*fX)

variancia = sum(fX.*(X.^2)) - media^2;

desvioPadrao = sqrt(variancia);

% 1c)
% X1 = 2
% X2 = {4, 5, 6, 7, 8}
% X = {2, 3, 4, 5, 6} há 5 casos possiveis quando X = X2 - 2
% X>3 = {4, 5, 6} são 3 casos favoráveis.
% Pela Lei de Laplace
% P(X > 3 | X1 = 2) =  Casos favoráveis / Casos possíveis = 3/5
fprintf("1c) O valor teórico da probabilidade de X ser maior que 3, sabendo que o primeiro número é 2: 3/5.\n\n");


% EXERCÍCIO 2
% Considere um sistema com 4 estados (1, 2, 3 e 4) modelado por uma cadeia
% de Markov com a matriz de transição de estados T seguinte.

T= [0.2 0.4 0.1 0
    0.4 0.3 0.1 0.1
    0.3 0.3 0.8 0.1
    0.1 0   0   0.8];

% (a) (3.0 valores) Qual a probabilidade de o sistema, começando no
%     estado 2, estar no estado 4 após 5 transições?
% (b) (2.0 valores) Qual a probabilidade de o sistema, começando no
%     estado 2, manter-se no estado 2 nas 5 primeiras transições?

display('Ex2 : ');

%2a
T5 = T^5;
fprintf('Probabilidade de,começando no estado 2, estar no estado 4 após 5 transições é: %f.\n' , T5(4 , 2));

% 2b)
fprintf('2b) A probabilidade de estar no estado 2 passado 5 transições é de %f.\n\n', T5(2,2)); 


% EXERCÍCIO 3
% Considere um conjunto de 4 páginas web (A, B, C e D) com os hyperlinks
% seguintes entre eles:
% A -> B , A -> C , B -> C , C -> D
%
% (3.0 valores) Determine o pagerank de cada página web ao fim de 10
% iterações assumindo beta = 0.8 e resolvendo primeiro problemas que
% possam existir de 'spider traps' e/ou 'dead-ends'.

H = [0   0  0  0
     0.5 0  0  0 
     0.5 1  0  0
     0   0  1  0];
% D é um dead-end

Hsolved = [0   0  0  0.25
           0.5 0  0  0.25 
           0.5 1  0  0.25
           0   0  1  0.25];
% HSolved representa a matriz com o dead-end resolvido e com os estados
% absorvidos juntos 
beta = 0.8;
N = length(Hsolved);
sobreN = ones(N)/N;

ranks = ones(N , 1)*1/N;

A = beta*Hsolved + (1-beta)*(sobreN);

pageranks = A^10*ranks;

fprintf("Os ranks das páginas são: A - %f, B - %f, C - %f, D - %f.\n\n", ranks(1), ranks(2), ranks(3), ranks(4));

% EXERCÍCIO 4
% Considere as 2 funções no fim deste script que implementam duas das
% funcionalidades necessárias à implementação de um filtro de Bloom.
% Considere também os dois conjuntos de chaves seguintes:

CH1= {'Amelia','Emma','Damian','Joe','Madison','Megan','Susan','Thomas'};
CH2= {'George','Jack','Oscar','Sarah'};

% (a) (3.0 valores) Desenvolva a função que falta para, com as funções
%     fornecidas, ter todas as funcionalidades necessárias à implementação
%     de um filtro de Bloom.
% (b) (2.0 valores) Desenvolva um script que (i) crie um filtro de Bloom
%     de comprimento 100 baseado em 6 funções de dispersão com as
%     chaves de CH1, (ii) teste a pertença das chaves de CH1 no filtro de
%     Bloom criado e (iii) verifique se as chaves de CH2 pertencem ao
%     filtro de Bloom.

% 4a)
function value = IsMember(BF , chave , k)
    value = true;  % Inicializar o output a true (pertence)
    % Fazer a hash e calculo das posicoes tal e qual como se fosse para
    % adicionar o valor
    h= 127;
    chave= double(chave);
    nBF= length(BF);
    for i= 1:length(chave)
        h= mod(31*h+chave(i),2^32-1);
    end
    for i= k:-1:1
        h= mod(31*h+i,2^32-1);
        if (BF(mod(h,nBF)+1) == 0)  % Se uma das posicoes tiver o valor 0 entao este elemento nao pertence ao BF
            value = false;  % Output a false (não pertence)
            break;
        end
    end
end



% Funcoes dadas pelos professores
function BF= Init(n)
    BF= zeros(n,1);
end

function BF= AddElement(BF,chave,k)
    h= 127;
    chave= double(chave);
    nBF= length(BF);
    for i= 1:length(chave)
        h= mod(31*h+chave(i),2^32-1);
    end
    for i= k:-1:1
        h= mod(31*h+i,2^32-1);
        BF(mod(h,nBF)+1)= 1;
    end
end

