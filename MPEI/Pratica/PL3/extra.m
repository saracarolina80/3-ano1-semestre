%% a) Matriz de Transição
H = [0.8 0  0.3 0;
     0.2 0.9 0.2 0;
     0 0.1 0.4 0;
     0 0 0.1 1];

% b)

X = [1 0 0 0];
prob = X * H^1000;
prob(2);

% c)

passos = [ 1 2 10 100];

for i = 1:4
    x0 = zeros(1, 4);
    x0(i) = 1
    for n = passos
        p0 = x0 * (H^n);
        fprintf("\n" + n +  ' Passos\n')
        fprintf("Partindo da "+i+" as probabilidades são -> "+p0(1)+" ,"+p0(2)+" ,"+p0(3)+" ,"+p0(4))
    end 
end 


% d) MATRIZ Q
Q = H(1:3 , 1:3);


% MATRIZ FUNDAMENTAL F

F = inv(eye(size(Q)) - Q);

%f )

%media de numeros de passos para atingir estado 4 (absorvente )

media = sum(F);

media(1)
media(2)
media(3)

% g)
tempo = sum(sum(F))

%h)
H = [0.8 0 0.35 0;
    0.2 0.9 0.2 0;
    0 0.1 0.4 0;
    0 0 0.05 1];
Q = H(1:3, 1:3)
F = inv(eye(size(Q)) - Q)
tempo = sum(sum(F))

