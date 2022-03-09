
n = 8000;
k = 3;
B = inicializar(n);

fileReader
insertedString = zeros(1,100);

for i = 1:10000
   % elem = ?
    B = adicionarElemento(B , elem , k);
end


r = membro(B , elem , k);
if r
    %fprintf(1,"%s esta no Filtro\n",elem);
    fp = fp + 1;
  %else
  %  fprintf(1,"%s nao esta no Filtro\n",elem);
end


fprintf(1,"Falsos Positivos: %d\n",fp);s
