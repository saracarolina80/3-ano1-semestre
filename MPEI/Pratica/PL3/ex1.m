% Considerando o estado 1 faltar
Tij = [0.2 0.3
       0.8 0.7]; 

x0 = [0 1]';

x1 = Tij * x0;
x2 = Tij^2 * x0;

fprintf('1a) reposta = %f\n', x2(2))

x0 = [1 0]';
x1 = Tij * x0;
x2 = Tij^2 * x0;

fprintf('1b) reposta = %f\n', x2(2));

x0 = [1 0]';
x29= Tij^29 * x0;
fprintf('1c) reposta = %f\n', x29(2));


v = [0.15 0.85]';
res = zeros(1, 30);
res(1) = 0.15;
for i = 2:30
    v = Tij * v;
    %v2 = Tij^2 * v;
    res(i) = v(1);
end
plot(res, '*-');