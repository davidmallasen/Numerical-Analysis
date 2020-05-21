function [t, x] = mmilne4bdf5(f, intervalo, x0, N)
% Metodo de prediccion-correccion. Metodo predictor: Milne explicito de 4
% pasos. Metodo corrector: BDF de 5 pasos. Inicializacion: Metodo
% de Runge-Kutta de orden 4.
%
% La funcion mmilne4bdf5 resuelve un problema de valor inicial de la forma
% x' = f(t, x) en [t0, T]
% x(t0) = x0,
% con x0 en R^n, mediante el metodo de prediccion-correccion indicado
% anteriormente.
%
% ENTRADA:
% f: nombre de la funcion (definida en formato anonimo o como fichero de 
%   tipo funcion de MATLAB) del problema que se quiere resolver, con dos 
%   argumentos de entrada: el primero es un numero real y el segundo es un 
%   vector columna de tipo (n, 1) o un vector fila de tipo (1, n)
% intervalo: [t0, T], donde esta planteado el sistema de ecuaciones 
%   diferenciales
% x0: vector inicial de tipo (1, n)
% N: numero de subintervalos
%
% SALIDA:
% t: vector columna de abscisas donde se va a aproximar la solucion de 
%   tipo (N + 1, 1)
% x: matriz de ordenadas de la solucion aproximada de tipo (N + 1, n)

r = 5; % Numero de pasos
x0 = x0(:);
dim = size(x0, 1);
h = (intervalo(2) - intervalo(1)) / N;
t = intervalo(1): h: intervalo(2);

% Calculamos los r - 1 primeros valores de x
[~, xr] = mrk4(f, [t(1), t(r)], x0, r - 1);

x = zeros(dim, N + 1);
ev = zeros(dim, r); % Guardamos las evaluaciones de f

x(:, 1:r) = transpose(xr); % Pasamos a filas

% Calculamos las r - 1 primeras evaluciones de f, la r la calcularemos en
% la primera iteracion del siguiente bucle, antes de la primera prediccion
for i = 2:r - 1  % No hace falta calcular f para x(:, 1)
    ev(:, i) = f(t(i), x(:, i));
end

% j0 y j indices circulares sobre ev
% j0 = f(t_i, x_i)
% j(k) = f(t_{i + k}, x_{i + k}), k = 1..r-1
j = zeros(r - 1);

for i = 1:N - r + 1
    % Calculamos los indices para esta iteracion
    % j0 = mod(i + r - 1, r) + 1;  % No se accede a f(t_i, x_i)
    for k = 2:r - 1  % No se accede a f(t_{i + 1}, x_{i + 1})
        j(k) = mod(i + k - 1, r) + 1;
    end
    
    % Evaluacion de la iteracion anterior, asi nos evitamos una evaluacion
    % innecesaria al final (vease el paso 4 del algoritmo de los apuntes)
    ev(:, j(r - 1)) = f(t(i + r - 1), x(:, i + r - 1));
    
    % Prediccion
    % Escribimos el metodo como un "falso metodo" de 5 pasos
    x(:, i + 5) = x(:, i + 1) + ( 4 * h / 3) * (2 * ev(:, j(4)) - ev(:, j(3)) + 2 * ev(:, j(2)));
    
    % Evaluacion
    tmp_ev = f(t(i + r), x(:, i + r));
    
    % Correccion
    x(:, i + 5) = (60 * h * tmp_ev + 300 * x(:, i + 4) - 300 * x(:, i + 3) + 200 * x(:, i + 2) - 75 * x(:, i + 1) + 12 * x(:, i)) / 137;
end

% Convertimos t en vector columna del tipo (N + 1, 1)
t = t(:);
% Convertimos la matriz x en una del tipo (N + 1, n)
x = transpose(x);  % x = x.';
