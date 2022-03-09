
%       a     b    c     d    e     f   
H = [
        0    0.5   0.5   0    1/4   0
        1     0    0     0    1/4   0
        0     0    0     1    1/4   0 
        0     0    0.5   0    1/4   1
        0    0.5   0     0    0     0 ];

N = 6;

matrizN = [ 1/6    1/6  1/6   1/6   1/6 1/6
        1/6 1/6 1/6  1/6 1/6    1/6
        1/6    1/6   1/6   1/6    1/6   1/6 
        1/6     1/6    1/6   1/6    1/6  1/6
        1/6    1/6   1/6     1/6    1/6    1/6 ];

B = 0.85;

% MATRIZ GOOGLE
A = B*H + (1-B)*matrizN 



x0 = ones(N , 1)/N

iter = 1;
x = x0;
epsilon = 1e-3;
while 1
    fprintf(1,'iteração %d\n',iter);
    xold=x;
    x=A*x;
    if max(abs(x-xold))<epsilon
        break; 
    end
    iter=iter+1;
end

[xs idx]=sort(x,'descend');
for p=1:N
    fprintf(1,'PageRank=%.3f : %s \n' , x(idx(p)), U{idx(p)});
end

