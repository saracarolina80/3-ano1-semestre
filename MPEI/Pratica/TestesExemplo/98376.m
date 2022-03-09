
% 1 a)
N = 1e6;

pecas = rand(6 , N) < 0.005;
def = sum(pecas);             % numero de peças defeituosas
X = 0:6;
pX = zeros(1,7);   

for i = X
    pX(i + 1) = sum(def==i)/N;
end

% 1 b)

valor_esperado = sum(pX.*X);

variancia = sum(pX.*(X.^2) - valor_esperado^2);

desvio_padrao = sqrt(variancia);


% 2 a)

% A uni. do Porto é um estado absorvente

%     Av    Li    Alg   Mi   Mad  Porto
Tji =[0.7  0.067  1/6  0.08  0.08   0
      0.15 0.8    1/6  0.08  0.75   0
      0    0      1/6  0.08  0      0
      0    0      1/6  0.6   0      0
      0    0.067  1/6  0.08  0.2    0
      0.15 0.067  1/6  0.08  0.375  1  ];



% 2 B)

% 2 c)
n = 1e100;

Tn = Tji ^ n;
fprintf('Probabilidade de,começando na U. Madeira, estar na U. Lisboa após um número muito grande de transições é: %f.\n' , Tn(5 , 2));


% 3 

function hc = hashFunction(shingle,nhf)
% USAGE EXAMPLE: hc=hashFunction('abcd',2)
% input : shingle  - string (of length 4)
%         nhf      - number of the hash function to apply (1 to 5)
% output: hc - from 0 to 998 (M-1)     

l = 4;  % shingle length, don't change
n = 7;  % max number of hash function

M = 999; % to limit hashcode to M-1

if length(shingle) ~= l
    fprintf(1,'ERROR! 1st parameter must have %d characters\n',l);
    
    hc = -1;
    return 
end

if nhf <1 || nhf > n
    fprintf(1,'ERROR! hf number must be between 1 and %d\n',n);
    hc = -1;
    return
end

R =[9754,95719,95952,74315;
    27850,48539,65576,39223;
    54689,80030,3571,65549;
    95753,14189,84915,17119;
    96491,42177,93402,70606;
    15761,91576,67875,3183;
    97062,79223,75776,27693];
    

R=R(:,1:l);
 
% each line of R defines a different hash function
r=R(nhf,:);

%   (\sum r * x ) mode M
hc=mod(sum (r.*  double(shingle)),M);

end
