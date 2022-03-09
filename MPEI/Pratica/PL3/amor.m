
%a)
    %r   %o   %m   %a  %.
T = [0   1/3  0    1/4  0
     .5  0    0.5  1/4  0
     0   1/3  0    1/4  0
     .5  0    0.5  0    0
     0   1/3  0    1/4  0];

word = generateWord(T);

fprintf("A palavra random gerada é: %s.\n" , word)


%b)
N = 1e5;
lista= {};
contadores = {1};
lista{1} = generateWord(T)

%Preencher cell array da lista de palvras unicas e cell array de contadores
for i = 2 : N
    word = generateWord(T);
    a = ismember(lista, word); %returns an array of booleans
    pos = find(a == true);     %return the position(s) of the true
    if (isempty(pos))          %Se pos = [] significa que não pertence à lista
        lista{end+1} = word;
        contadores{end+1} = 1;
    else
        contadores{pos} = contadores{pos} + 1;
    end
end

%Preencher cell array com probabilidades
probabilidades = {1, length(contadores)};
for i = 1 : length(contadores)
    probabilidades{i} = contadores{i} / N;  %Contem as probabilidades de cada palavra gerada
end

fprintf("Foram geradas %d palavras diferentes.\n",length(lista));
[p, idx] = sort(cell2mat(probabilidades), 'descend');
for i = 1 : 5
    fprintf("A %dª maior probabilidade é de %s = %.4f.\n", i, lista{i}, probabilidades{idx(i)});
end



function [word] = generateWord(T)
    first = randi(4);                %Probabilidade da primeira letra é igual para todas
    state = crawl(T, first, 5);
    state = state(1:length(state) -1);
    set_of_letters = 'roma';
    word = set_of_letters(state);  %Substituiu estado por letras
end




% Random walk on the Markov chain
% Inputs:
% H - state transition matrix
% first - initial state
% last - terminal or absorving state
function state = crawl(H, first, last)
    % the sequence of states will be saved in the vector "state"
    % initially, the vector contains only the initial state:
    state = [first];
    % keep moving from state to state until state "last" is reached:
    while (1)
        state(end+1) = nextState(H, state(end));
        if (state(end) == last)
            break;
        end
    end
end


% Returning the next state
% Inputs:
% H - state transition matrix
% currentState - current state
function state = nextState(H, currentState)
    % find the probabilities of reaching all states starting at the current one:
    probVector = H(:,currentState)'; % probVector is a row vector
    n = length(probVector); %n is the number of states
    % generate the next state randomly according to probabilities probVector:
    state = discrete_rnd(1:n, probVector);
end
% Generate randomly the next state.
% Inputs:
% states = vector with state values
% probVector = probability vector
function state = discrete_rnd(states, probVector)
    U=rand();
    i = 1 + sum(U > cumsum(probVector));
    state= states(i);
end