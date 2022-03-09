% primeiro script



dic = readcell('users.txt' , 'Delimiter' , ';');  % dic{i,j} contém a informação da linha i e da coluna j do ficheiro

udata = load('friends.txt');
id = dic(: , 1);     % ID do utilizador
Name = dic(: , 2:3);
interesses = dic(: , 4:end); % interesses
% disp(Name);

% fica apenas com as duas primeiras colunas ( 1 - ID do user e 2 - ID de um
% friend
u = udata(1:end, 1:2); clear udata;

friends = your_friends(u);


n_shingle = 3;
n_nomes = length(Name);
n_hash_nomes = 100;    % estava a 100
minHash = inf(n_nomes, n_hash_nomes);

x = waitbar(0,'A calcular minHash()...');
for k = 1 : n_nomes
    waitbar(k/n_nomes,x);
    nomes = Name{k};
    len = length(nomes);
    for j = 1 : (len - n_shingle + 1)
        key = lower(char(nomes(j:(j+n_shingle-1)))); 
        h = zeros(1, n_hash_nomes);
        for i = 1 : n_hash_nomes
            key = [key num2str(i)];
            h(i) = DJB31MA(key, 127);
        end
    minHash(k, :) = min([minHash(k, :); h]);
    end
end
delete(x);


save 'database.mat' 'friends' 'dic' 'Name' 'n_shingle' 


function [Set] = your_friends(u)
    % Lista de utilizadores
    users = unique(u(:,1)); % Extrai os IDs dos utilizadores
    Nu= length(users); % Número de utilizadores
    Set= cell(Nu,1); 
    for n = 1:Nu % Para cada utilizador
        ind = find(u(:,1) == users(n));
        Set{n} = [Set{n} u(ind,2)];
    end
end