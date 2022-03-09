
function [B] = adicionarElemento(B, k , n , elemento)

    key = elemento;
    for i = 1:k
        aux = hashfunction(key , n);
        pos = rem(aux , n);
        n = length(B);
        B(pos + 1) = 1;
        key = [key num2str(i)];
    end

end