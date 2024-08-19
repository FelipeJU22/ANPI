function res = sinh_t(x)
    S_k = 0;
    term = x;
    n = 0;
    tol = 1e-8;

    while true
        % Calcular S_(k+1)
        S_k1 = S_k + term;

        % Comprobar el criterio de parada
        if abs(S_k1 - S_k) < tol
            break;
        end

        % Actualizar para la siguiente iteración
        n = n + 1;
        S_k = S_k1;
        term = (x^(2*n+1)) * div_t(factorial(2*n+1));
    endwhile

    res = S_k1;
endfunction

