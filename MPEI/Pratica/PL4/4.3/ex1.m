% Codigo base para detecao de pares similares
udata=load('u.data'); % Carrega o ficheiro dos dados dos filmes
% Fica apenas com as duas primeiras colunas
u= udata(1:end,1:2); clear udata;
% Lista de utilizadores
users = unique(u(:,1)); % Extrai os IDs dos utilizadores
Nu= length(users); % Nu´mero de utilizadores
% Constro´i a lista de filmes para cada utilizador
Set= cell(Nu,1); % Usa ce´lulas

for n = 1:Nu % Para cada utilizador
    % Obte´m os filmes de cada um
    ind = find(u(:,1) == users(n));
    % E guarda num array. Usa ce´lulas porque utilizador tem um nu´mero
    % diferente de filmes. Se fossem iguais podia ser um array
    Set{n} = [Set{n} u(ind,2)];
end

%% Calcula a distaˆncia de Jaccard entre todos os pares pela definic¸a˜o.
J=zeros(Nu); % array para guardar distaˆncias
h= waitbar(0,'Calculating');
for n1= 1:Nu
    waitbar(n1/Nu,h);
    for n2= n1+1:Nu
    %% Adicionar co´digo aqui
        J(n1,n2) = sum(MinHashValue(n1,:) ~= MinHashValue(n2,:))/K;
    end
end

delete (h)
%% Com base na distaˆncia, determina pares com
%% distaˆncia inferior a um limiar pre´-definido
threshold = 0.4; % limiar de decisa˜o
% Array para guardar pares similares (user1, user2, distaˆncia)
SimilarUsers= zeros(1,3);
k= 1;
for n1= 1:Nu

    for n2= n1+1:Nu
        if J(n1,n2) <= threshold
            SimilarUsers(k,:) = [users(n1) users(n2) J(n1,n2)];
            k= k+1;
        end
    end
end