function logNatural = ln_t(x)
  % Verifica que a sea mayor que 0 y distinto de 1
  if x <= 0 || x == 1
    error('El valor de a debe ser mayor que 0 y distinto de 1');
  endif

  sumaAnterior = 0;
  suma = 0;
  numTerminos = 0;
  tol = 1e-8;
  maxIteraciones = 2500;


  % Calcula la suma de los términos hasta alcanzar la tolerancia o el máximo de iteraciones
  while numTerminos < maxIteraciones
    termino = (1 * div_t(2 * numTerminos + 1)) * ((x - 1) * div_t(x + 1)) ^ (2 * numTerminos);
    suma += termino;
    % Verifica el criterio de parada
    if abs(((2 * (x - 1)) * div_t(x + 1)) * suma - ((2 * (x - 1)) * div_t(x + 1)) * sumaAnterior) < tol
      break;
    endif
    sumaAnterior = suma;
    numTerminos += 1;
  endwhile

  logNatural = ((2 * (x - 1)) * div_t(x + 1)) * suma;
endfunction

