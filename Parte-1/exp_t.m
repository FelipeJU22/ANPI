function res = exp_t(x)
    tol = 1e-8;
    maxIter = 2500;

    % Inicializar la serie de Taylor
    x0 = 1;
    res = x0;
    n = 1;

    % Iterar hasta que el término sea menor que la tolerancia o alcanzar el límite de iteraciones
    while n <= maxIter
        x0 = x0 * x * div_t(n);  % Calcula el siguiente término
        res = res + x0;  % Suma el término al resultado

        % Verificar si el término es menor que la tolerancia
        if abs(x0) < tol
            break;
        end

        n = n + 1;
    end

endfunction

