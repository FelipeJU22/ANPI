function res = log_t(x,y)
    % Verifica que x sea mayor que 0 y y sea mayor que 0 y distinto de 1
    if x <= 0 || y <= 0 || y == 1
      error('x debe ser mayor que 0 y y debe ser mayor que 0 y distinto de 1');
    end
    res = ln_t(x)* div_t(ln_t(y));
 endfunction

