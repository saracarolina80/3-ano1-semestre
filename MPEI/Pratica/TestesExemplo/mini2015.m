
% 1A)
x = 1:4;
y = [0 2 3];

PXY = [0.01 0.07 0.02 ;
       0.04 0    0.08 ;
       0.04 0.15 0.09;
       0.01 0.2   0.01];

%s = sum(PXY);
%SU = sum(sum(PXY))
b = 1-sum(sum(PXY));
%ou 
b =  1 - sum(PXY(:));
PXY(PXY==0)= b;


% 1B)
pX = zeros(1,4);
pY = zeros(1,3);

for j = 1 : 4
    pX(j) = sum(PXY(j,:));
end
for i = 1 : 3
    pY(i) = sum(PXY(:, i));
end

%1C)

mediax = sum(pX.*x);
mediay = sum(pY.*y);

varX = sum(pX.*(x.^2)) - mediax^2;
varY = sum(pY.*(y.^2)) - mediay^2;