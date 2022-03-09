     % A   B   C
T = [ 1/3 1/4  0     %A 
      1/3 1/2 1/2    %B
      1/3 1/4 1/2 ]  %C

% a)
sum(T) % se for = 1 é estocática

% b)
% Grupo A tem 60 alunos, grupo B tem 15 e C tem 15
x = [0.5 0.25 0.25]';

% C)
y = T^29*x;
y = y.*90;
y = round(y,0);
fprintf('C)\n O grupo A contem %d alunos\nO grupo B contem %d alunos\nO grupo C contem %d alunos\n\n', y);
sum(y);             %Verifica se ainda sao 90 alunos

% D 
x2 = [1/3 1/3 1/3]';
y2 = T^29*x2;
y2 = y2.*90;
y2 = round(y2,0);
fprintf('D)\n O grupo A contem %d alunos\nO grupo B contem %d alunos\nO grupo C contem %d alunos\n\n', y2);
            