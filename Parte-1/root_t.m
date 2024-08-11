function res = root_t(x, y)

    x_k = x * div_t(2);
    iter = 0;
    maxIter = 2500;
    tol = 1e-8;

    % Verifica si y es un entero positivo
    if (y > 0) && (y == floor(y))
        while iter < maxIter
        % Calcular el siguiente valor de la iteración
        x_k1 = x_k - (x_k^y - x) * div_t(y * x_k^(y-1));

        % Criterio de parada
        if abs(x_k1 - x_k) < tol * abs(x_k1)
            break;
        end

        % Actualizar para la siguiente iteración
        x_k = x_k1;
        iter = iter + 1;
    endwhile

    % Retornar el resultado
    res = x_k1;
    else
        res = power_t(x, 1*div_t(y));
    end
    res = res;
endfunction

