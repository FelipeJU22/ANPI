function res = cot_t(x)
    tol = 1e-8;

    if abs(sen_t(x)) < tol
        error('El valor de sen_t(x) es demasiado pequeño, lo que puede causar una división por cero.');
    end

    res = cos_t(x) * div_t(sen_t(x));

endfunction
