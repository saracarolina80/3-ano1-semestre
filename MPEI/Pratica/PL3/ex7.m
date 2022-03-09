
%a)
%    A B   C D E   F
H = [0 0   0 0 1/3 0
     1 0   0 0 1/3 0
     0 0.5 0 1 0   0
     0 0   1 0 0   0
     0 0.5 0 0 0   0
     0 0   0 0 1/3 0];

c = sum(H);         % numero de ligações
N = 10;


H = H./repmat(c , N , 1);


p=0.8;
A=p*H+(1-p)*ones(N)/N; % matriz da Google
A(isnan(A))=1/N; % resolver dead ends


[xs idx]=sort(x,'descend');
for p=1:N
fprintf(1,'PageRank=%.3f : %s \n', x(idx(p)), U{idx(p)});
end



