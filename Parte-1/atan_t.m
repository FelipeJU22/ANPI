function res = atan_t(x)
    S_k = 0;
    term = x;
    n = 0;
    tol = 1e-8;
    maxIter = 2500;

    % Caso 1: -1 < x < 1
    if abs(x) <= 1
        while n <= maxIter
            % Calcular S_(k+1)
            S_k1 = S_k + ((-1)^n) * (x^(2*n+1)) * div_t(2*n + 1);

            % Comprobar el criterio de parada
            if abs(S_k1 - S_k) < tol
                break;
            end

            % Actualizar para la siguiente iteración
            S_k = S_k1;
            n = n + 1;

        endwhile

    % Caso 2: x > 1
    elseif x > 1
        while n <= maxIter
            % Calcular S_(k+1)
            S_k1 = S_k + ((-1)^n) * div_t((2*n + 1) * (x^(2*n+1)));

            % Comprobar el criterio de parada
            if abs(S_k1 - S_k) < tol
                break;
            end

            % Actualizar para la siguiente iteración
            S_k = S_k1;
            n = n + 1;
        endwhile

        % Aplicar la identidad: atan(x) = pi/2 - serie
        S_k1 = pi * div_t(2) - S_k1;

    % Caso 3: x < -1
    elseif x < -1
        while n <= maxIter
            % Calcular S_(k+1)
            S_k1 = S_k + ((-1)^n) * div_t((2*n + 1) * (x)^((2*n+1)));

            % Comprobar el criterio de parada
            if abs(S_k1 - S_k) < tol
                break;
            end

            % Actualizar para la siguiente iteración
            S_k = S_k1;
            n = n + 1;
        endwhile

        % Aplicar la identidad: atan(x) = -pi/2 - serie
        S_k1 = -pi* div_t(2) - S_k1;
    end

    % Retornar el resultado
    res = S_k1;
endfunction

