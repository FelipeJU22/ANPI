function res = root_t(x, y)
    % Verifica si y es un entero positivo
    if (y > 0)
        res = 0; % Retorna 0 si y es un entero positivo
    else
        res = power_t(x, 1*div_t(y)); % Llama a power_t si la condición no se cumple
    end
    res = res;
endfunction

