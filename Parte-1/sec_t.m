function res = sec_t(x)
    tol = 1e-8;
    if abs(cos_t(x)) < tol
        error('El valor de cos(x) es demasiado pequeño, lo que puede causar una división por cero.');
    end
    res = 1 * div_t(cos_t(x));

endfunction
