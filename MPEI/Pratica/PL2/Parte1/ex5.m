%% Guiao L02 ---> 2.1

% Exercicío 5

% O dado é equilibrado 

% “A – a soma dos dois valores é igual a 9”.
% “B – o segundo valor é par”.
% “C – pelo menos um dos valores é igual a 5”. 
% “D – nenhum dos valores é igual a 1”.

% a) P(A)

n_exp = 10000;
n = 2;
dados = randi(6,n,n_exp);
soma = sum(dados);
A = soma == 9; 
TotalS9 = sum(A); % Número total em que a soma de dois valores é 9
prob_A = TotalS9 / n_exp;

fprintf("\nA probabilidade dos dois valores ser igual a 9 é: %f \n", prob_A);


% P(B) 

n_exp = 10000;
n = 2;
dados = randi(6,n,n_exp);
L2_par = rem(dados(2,:),2) == 0;
probB = sum(L2_par) / n_exp;

fprintf("A probabilidade do segundo valor ser par é: %f \n", probB);


% P(C) 

n_exp = 10000;
n = 2;
dados = randi(6,n,n_exp);
Pelo_menos_um5 = dados == 5;
Total = sum(Pelo_menos_um5 > 0);

probC = sum(Total) / n_exp;

fprintf("A probabilidade de um dos valores ser igual a 5 é: %f \n", probC);


%P(D) = 1 - P(todos os valores serem iguais a 1)

n_exp = 10000;
n = 2;
dados = randi(6,n,n_exp);
Iguais_1 = dados == 1;
Iguais_1Total = sum(Iguais_1);

prob = sum(Iguais_1Total) / n_exp;

prob_D = 1 - prob;

fprintf("A probabilidade de nenhum dos valores ser igual a 1 é: %f \n", prob_D);


