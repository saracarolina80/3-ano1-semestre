% Author: DS <ds@OmenDS>
% Created: 2018-11-15


function [stringUniques,allWords] =fileReader(ficheiro)

allWords={};
stringUniques={};
stringIndex=1;

%  para todos os ficheiros no array ficheiros...
   fprintf(1,'Processando %s\n',ficheiro);
    % NOTA: atencao ao uso de {} por ficheiros ser um cell array

    % abrir um dos ficheiros para leitura
    fid=fopen(ficheiro);

    %  enquanto nao terminar o ficheiro
    while 1
    
        % ler uma linha do ficheiro
        linha=fgetl(fid);
    
        % se nao for um caractere termina
        if ~ischar(linha), break, end
    
        if length(linha)>1
            linha=[linha sprintf('\n')];
            words = strsplit(linha,{" ",".",",","/",";"," "});
            for i=1 : length(words)
              if words{i}!=" " && words{i} != "." && words{i} != "," && words{i} != "/"
                thisWord = strsplit(words{i},{"\n"});
                allWords{stringIndex}=thisWord{1};
                stringIndex++;    
              endif

            endfor
    
        endif
       
    end

    fclose(fid);  %  nao esquecer de fechar o ficheiro
    stringUniques=unique(allWords);

fprintf(1,'Terminado.\n')