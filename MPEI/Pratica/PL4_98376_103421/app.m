% segundo script
clc;

load ('database.mat');
% pedir o ID do utilizador 
user = input('Insert User ID: ');

while (user <  1 || user> 1000)                  % No users.txt reparamos que existem 1000 utilizadores
    fprintf('Invalid ID!\n');
    user = input('Insert Valid User ID: ');
end


while true
    option = input('Options:\n 1-Your Friends\n 2-Interests from most similar user\n 3-Search Name\n 4-Find most similar users based in list of interests\n 5-Exit\n Select your choice: ');
    
    while ( option < 1 || option > 5)
        fprintf('Invalid option')
        option = input('\nSelect choice: ');
    end

    switch option

        case 1      % opção 1
            get_your_friends(user , friends , Name)
            pause(5)
        case 2
            suggested_interests(minHash, n_hash, u, interesses, ID)
           
        case 3
            searchName(minHash_nomes , n_hash_nomes , Name , n_shingle)
            pause(5)
          
        case 4
            fprintf('Sorry but this option doesn´t work :( \n');
            pause(2)

        case 5      % opção 5 termina o programa
            break;
    end
end

% ------------ functions --------

function [] = get_your_friends(user , friends , Name)
    index = friends{user}; 
    fprintf('Your friends are:\n');
    len = length(index);

    for i = 1 : len
        ID = index(i);
        name = Name(ID,1:2);
        line = [ID, name];
        disp(line);
    end
    fprintf("\nNumber of friends by user: " + len + "\n");
end


function [] = searchName(minHash_nomes , n_hash_nomes , Name , n_shingle)
    string = lower(input('Write a string: ', 's'));
    while (length(string) < n_shingle)
        fprintf('Write a minimum of %d characters\n', n_shingle);
        string = lower(input('Write a string: ', 's'));
    end
    
    
    % Cell array com os shingles da string introduzida
    shinglesAns = {};
    for i = 1:length(string) - n_shingle+1
        shingle = string(i:i+ n_shingle-1);
        shinglesAns{i} = shingle;
    end

    % Retorna um array com os minHashs
    len = length(string);
    minHash_search = inf(1, n_hash_nomes);
    for j = 1 : length(shinglesAns)
        key = char(shinglesAns{j}); 
        h = zeros(1, n_hash_nomes);
        for i = 1 : n_hash_nomes
            key = [key num2str(i)];
            h(i) = DJB31MA(key, 127);
        end
        minHash_search(1, :) = min([minHash_search(1, :); h]);
    end
    
    % Permite obter todos os nomes mais similares à palavra fornecida e
    % as respetivas distâncias estimadas (em cel arrays) através do minHash
    % desenvolvido  
    n_nomes = length(Name);
    threshold = 0.99;
    similar_names = {};
    distances = {};
    k = 0;
    for n = 1 : n_nomes
        distancia = 1 - (sum(minHash_search(1, :) == minHash_nomes(n,:)) / n_hash_nomes);
        if (distancia < threshold)
            k = k + 1;  % número de títulos obtidos
            similar_names{k} = Name{n};
            distances{k} = distancia;
        end
    end

    %  A lista apresentada deve ter no maximo 5 títulos
    if (k == 0)
        disp('No results found');
    elseif (k > 5)
        k = 5;
    end
    
    % Distância ordenada por oodem crescente
    distances = cell2mat(distances);
    [distances, index] = sort(distances);
    
    for h = 1 : k
        fprintf('%s - %.3f\n', similar_names{index(h)}, distances(h));
    end
end


function [SimilarUsers] = getSimilarUsers(u, minHash, K, threshold, user)

    users = unique(u(:,1)); % Extrai os IDs dos utilizadores
    Nu = length(users); % Número de utilizadores
    
    SimilarUsers = zeros(1,3);
    k = 1;
    for n = 1 : Nu 
        distancia = 1 - sum(minHash(user,:) == minHash(n,:)) / K;
        if ( distancia < threshold  && user ~= n )  
            SimilarUsers(k,:) = [users(user) users(n) distancia];
            k = k + 1;
        end
    end
end



function [interests] = suggested_interests(minHash, n_hash, u, interesses, ID)
    
    set = get_your_friends(u); % Conjunto do nº de amigos por cada utilizador 
    
    similar_users = getSimilarUsers(u, minHash, n_hash, 1, ID); % [users(ID) users(n) distância]
   
    row = find(similar_users(:, 3) == min(similar_users(:, 3))); % Utilizador mais similar ao user atual 
    
    % interesses que o utilizador atual não viu  
    not_interests = setdiff([set{similar_users(row, 2)}], [set{similar_users(row, 1)}]); 
 
    interests = [];
    c = 1;
    for k = 1 : length(not_interests) % Percorre todos interesses não vistos pelo user_id
        if (interesses(not_interests(k), genre_id) == 1)
            interests(c, 1) = not_interests(k);
            c = c + 1;
        end
    end
  
    if (isempty(interests))
        disp('No suggestions found.');
    else
        n_suggested = length(interests);
        for k = 1 : n_suggested     
            disp(interesses{interests(k, 1)});    % Conjunto de todos os filmes em função da sugestão pedida
        end
    end
end




