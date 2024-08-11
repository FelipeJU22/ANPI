function x0 = div_t(x)
    % Definir epsilon y tolerancia
    eps = 2.2204e-16;
    tol = 1e-8;
    maxIter = 2500;
    % Asignar valor inicial según el rango de a
    if x > factorial(100)
        x0 = 0;
        disp(x0);  % Imprimir el resultado
        return;
    elseif x > factorial(80)
        x0 = eps^15;
    elseif x > factorial(60)
        x0 = eps^11;
    elseif x > factorial(40)
        x0 = eps^8;
    elseif x > factorial(20)
        x0 = eps^4;
    else
        x0 = eps^2;
    end

    % Iteración con un bucle for hasta el máximo de iteraciones
    for iter = 1:maxIter
        x1 = x0 * (2 - x * x0);
        if abs(x1 - x0) < tol * abs(x1)
            break;
        end
        x0 = x1;
    end

    return;
end

