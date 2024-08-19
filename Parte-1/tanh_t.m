function res = tanh_t(x)
    tol = 1e-8;

    if abs(cosh_t(x)) < tol
        error('El valor de cosh(x) es demasiado pequeño, lo que puede causar una división por cero.');
    end

    res = senh_t(x) * div_t(cosh_t(x));
endfunction
