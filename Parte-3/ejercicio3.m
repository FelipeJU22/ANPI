pkg load symbolic;  % Cargar el paquete simbólico

% Definir la variable simbólica y la función
syms x;
f = x^2 / sqrt(x^2 - 4);

% 1. Dominio de la función
disp('Dominio de la función:');
domain = simplify(solve(x^2 - 4 > 0, x));  % La raíz debe ser positiva
disp('El dominio de la función es:');
disp(domain);

% 2. Intersección con el eje x
disp('Intersección con el eje x:');
x_intersections = solve(f == 0, x);
disp('Las intersecciones con el eje x son:');
disp(x_intersections);

% 3. Asintotas verticales
disp('Asintotas verticales:');
% Las asíntotas verticales ocurren cuando el denominador es cero y el numerador no es cero
vertical_asymptotes = solve(x^2 - 4 == 0, x);  % Donde la raíz es cero
disp('Las asintotas verticales son:');
disp(vertical_asymptotes);

% 4. Asintotas horizontales
disp('Asintotas horizontales:');
% Para asintotas horizontales, calcular el límite cuando x tiende a infinito y menos infinito
horizontal_asymptote_pos_inf = limit(f, x, inf);
horizontal_asymptote_neg_inf = limit(f, x, -inf);
disp('La asintota horizontal cuando x tiende a +∞ es:');
disp(horizontal_asymptote_pos_inf);
disp('La asintota horizontal cuando x tiende a -∞ es:');
disp(horizontal_asymptote_neg_inf);

% 5. Asintotas inclinadas
disp('Asintotas inclinadas:');
% Las asintotas oblicuas no existen si hay asintotas horizontales no nulas.
if horizontal_asymptote_pos_inf == 0 && horizontal_asymptote_neg_inf == 0
    m = limit(f/x, x, inf);  % Pendiente de la asintota oblicua
    b = limit(f - m*x, x, inf);  % Intersección con el eje y
    oblique_asymptote = m*x + b;
    disp('La asintota oblicua es:');
    disp(oblique_asymptote);
else
    disp('No hay asintotas inclinadas debido a la existencia de asintotas horizontales.');
end

% 4. Primera y segunda derivada
f_prime = diff(f, x);
f_double_prime = diff(f_prime, x);

disp('Primera derivada:');
disp(simplify(f_prime));
disp('Segunda derivada:');
disp(simplify(f_double_prime));

% 5. Intervalos donde la función es creciente y decreciente
disp('Intervalos donde la función es creciente y decreciente:');
critical_points = solve(f_prime == 0, x);
disp('Puntos críticos:');
disp(critical_points);

% Evaluar signos de f' en los intervalos determinados por los puntos críticos
% Usaremos puntos de prueba para determinar los intervalos crecientes y decrecientes

% Definir una función para evaluar el signo de f'
test_points = [-10, 0, 10];  % Elegir algunos puntos de prueba
for pt = test_points
    f_prime_value = subs(f_prime, x, pt);
    fprintf('f''(%d) = %f\n', pt, double(f_prime_value));
end

% 6. Intervalos donde la función es cóncava hacia arriba y hacia abajo
disp('Intervalos donde la función es cóncava hacia arriba y hacia abajo:');
critical_points_double = solve(f_double_prime == 0, x);
disp('Puntos críticos de la segunda derivada:');
disp(critical_points_double);

% Evaluar signos de f'' en los intervalos determinados por los puntos críticos de la segunda derivada
% Usaremos puntos de prueba para determinar los intervalos cóncavos hacia arriba y hacia abajo

% Definir una función para evaluar el signo de f''
test_points_double = [-10, 0, 10];  % Elegir algunos puntos de prueba
for pt = test_points_double
    f_double_prime_value = subs(f_double_prime, x, pt);
    fprintf('f''''(%d) = %f\n', pt, double(f_double_prime_value));
end





% Graficar la función y sus derivadas
figure;

% Grafica de la función
subplot(3, 1, 1);
fplot(matlabFunction(f), [-4, 4], 'LineWidth', 2);
title('Función f(x)');
xlabel('x');
ylabel('f(x)');
grid on;

% Grafica de la primera derivada
subplot(3, 1, 2);
fplot(matlabFunction(f_prime), [-3, 3], 'LineWidth', 2, 'r');
title('Primera Derivada f''(x)');
xlabel('x');
ylabel('f''(x)');
grid on;

% Grafica de la segunda derivada
subplot(3, 1, 3);
fplot(matlabFunction(f_double_prime), [-3, 3], 'LineWidth', 2, 'g');
title('Segunda Derivada f''''(x)');
xlabel('x');
ylabel('f''''(x)');
grid on;

disp('Fin del análisis y generación de gráficos.');
