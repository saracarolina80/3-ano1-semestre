
p = 0.4;
q = 0.6;

% a)
     %   A      B         C         D
T = [   
        p^2  (1-p)^2    p*(1-p)    p*(1-p)
         0      0         0         1
         0      0         0         1
         q^2   q*(1-q)   q*(1-q)     (1-q)^2 ]';

% b)

x = [ 1 0 0 0]';
iteracoes = [ 5 10 100 200];

for i = 1:4
    y = T^iteracoes(i) * x;
    fprintf('Para %d iteracoes a probabilidade de estar em A é %.8f em B é %.8f em C é %.8f e em D é %.8f\n', iteracoes(i), y);
end

% c)



