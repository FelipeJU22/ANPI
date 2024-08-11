function res = exp_t(x)
    % Definir tolerancia y límite de iteraciones
    tol = 1e-8;
    maxIter = 2500;

    % Inicializar la serie de Taylor
    x0 = 1; % Primer término de la serie: a^0 / 0!
    res = x0;
    n = 1;

    % Iterar hasta que el término sea menor que la tolerancia o alcanzar el límite de iteraciones
    while n <= maxIter
        x0 = x0 * x / n;  % Calcula el siguiente término: a^n / n!
        res = res + x0;  % Suma el término al resultado

        % Verificar si el término es menor que la tolerancia
        if abs(x0) < tol
            break;
        end

        n = n + 1;  % Incrementar el contador de iteraciones
    end

end

