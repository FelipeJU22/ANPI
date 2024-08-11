function x0 = power_t(x, y)
    % Verificar si x es 0 y y es negativo, ya que esto no está definido
    if x == 0 && y < 0
        error('No se puede calcular la potencia de 0 con un exponente negativo.');
    end

    x0 = exp_t(y * ln_t(x));
endfunction


