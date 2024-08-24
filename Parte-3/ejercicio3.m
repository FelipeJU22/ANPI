clc

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

% 6. Primera y segunda derivada
f_prime = diff(f, x);
f_double_prime = diff(f_prime, x);

disp('Primera derivada:');
disp(simplify(f_prime));
disp('Segunda derivada:');
disp(simplify(f_double_prime));

% 7. Intervalos donde la función es creciente y decreciente
disp('Intervalos donde la función es creciente y decreciente:');
critical_points = solve(f_prime == 0, x);

% Excluir x = 0 de los puntos críticos
critical_points = critical_points(critical_points ~= 0);

disp('Puntos críticos (excluyendo x = 0):');
disp(critical_points);

% Evaluar la función en puntos críticos y en los extremos para determinar los intervalos crecientes y decrecientes
for i = 1:length(critical_points)
    cp = critical_points(i);
    fprintf('Punto crítico %d: %s\n', i, char(cp));

    % Evaluar la función en el punto crítico
    f_cp = subs(f, x, cp);

    % Determinar el punto de prueba adecuado
    if cp < 0
        test_point = -10;
    else
        test_point = 10;
    end

    % Evaluar la función en el punto de prueba
    f_test_point = subs(f, x, test_point);

    if f_cp < f_test_point
        if cp < 0
            fprintf('La función es creciente en ]-∞, %s]\n', char(cp));
        else
            fprintf('La función es decreciente en [%s, +∞[\n', char(cp));
        end
    else
        if cp < 0
            fprintf('La función es decreciente en [%s, +∞[\n', char(cp));
        else
            fprintf('La función es creciente en [%s, +∞[\n', char(cp));
        end
    end
end

% 8. Intervalos donde la función es cóncava hacia arriba y hacia abajo
disp('Intervalos donde la función es cóncava hacia arriba y hacia abajo:');
critical_points_double = solve(f_double_prime == 0, x);

% Excluir x = 0 de los puntos críticos de la segunda derivada
critical_points_double = critical_points_double(critical_points_double ~= 0);

disp('Puntos críticos de la segunda derivada (excluyendo x = 0):');
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

