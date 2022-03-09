
% a)
   %  1   2   3  4  5
T = [0.8  0   0 0.3 0 % 1
     0.2 0.6  0 0.2 0  % 2
     0   0.3  1 0   0  % 3
     0   0.1  0 0.4 0  % 4
     0   0    0 0.1 1]; % 5
sum(T);

% b)
v = [1 0 0 0 0]';
n = zeros(1 , 100);
n(1) = 0;
for i = 2:100
    v = T * v;
    n(i) = v(2);
end
plot(1:100 , n)
xlabel("Numero de transições")
ylabel("probabilidade de estar no estado 2")

% c)
v = [ 1 0 0 0 0]';
n = zeros(1 , 100);
n(1) = 0;
for i = 2:100
    v = T * v;
    n(i) = v(3);
end
v = [ 1 0 0 0 0]';
n2 = zeros(1 , 100);
n2(1) = 0;
for i = 2:100
    v = T * v;
    n2(i) = v(5);
end

figure(2)
subplot(1,2,1)
plot(1:100 , n)
title("estado 3")
subplot(1,2,2)
plot(1:100 , n2)
title("estado 5")

%Como os estados são absorventes, à medida que há passagem de estados a
% probabilidade de estar num estado absorvente tende para 1


% d) MATRIZ Q descreve probabilidades de transição de estados não-absorventes para
%    estados não-absorventes 

% Matriz canónica  ( estados transientes aparecem primeiro )
C=[ 0.8  0  0.3  0 0
    0.2 0.6 0.2  0 0
    0   0.1 0.4  1 0
    0   0.3 0    0 0
    0   0   0.1  0 1];
sum(C);

% Matriz Q (primeiras linhas de C (estados-não absorventes)
Q = C(1:3 , 1:3);


% e) # Matriz fundamental F = (I - Q)^-1

F = (eye(3)- Q)^-1;         % I = eye(3)
sum(F);

% f) 
t = F'*ones(3,1);
%ou sum(F)
fprintf('A probabilidade de absorção se partir do estado 1 é: %.4f\nDo estado 2 é: %.4f\nDo estado 3 é: %.4f\n', t);

% g)
R = C(4:5, 1:3);
B = R*F; %coluna comecar em estado transitorio e linha acabar no estado absovente
fprintf('Prob(estado 3) = %f, Prob(estado 5) = %f',B(1,1),B(2,1));
