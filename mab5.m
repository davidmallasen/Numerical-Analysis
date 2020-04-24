function [t, x] = mab5(f, intervalo, x0, N)
% Metodo de Adams-Bashforth de 5 pasos.
%
% La funcion mab2 resuelve un problema de valor inicial de la forma
% x'=f(t,x) en [t0,T]
% x(t0)=x0,
% con x0 en R^n, mediante el metodo de Adams-Bashforth de 5 pasos.
%
% ENTRADA:
% f: nombre de la funcion (definida en formato anonimo o como fichero de tipo funcion de MATLAB)
% del problema que se quiere resolver, con dos argumentos de entrada: el primero es un
% numero real y el segundo es un vector columna de tipo (n,1) o un vector fila de tipo (1,n)
% intervalo: [t0,T], donde esta planteado el sistema de ecuaciones diferenciales
% x0: vector inicial de tipo (1,n)
% N: numero de subintervalos
%
% SALIDA:
% t: vector columna de abscisas donde se va a aproximar la solucion de tipo (N+1,1)
% x: matriz de ordenadas de la solucion aproximada de tipo (N+1,n)

r = 5; % Numero de pasos
x0 = x0(:);
dim = size(x0, 1);
h = (intervalo(2) - intervalo(1)) / N;
t = intervalo(1): h: intervalo(2);

% Calculamos los r-1 primeros valores
[~, xr] = mrk4(f, [t(1), t(r)], x0, r - 1);

x = zeros(dim, N + 1);
ev = zeros(dim, r); % Guardamos las evaluaciones de f

x(:, 1:r) = transpose(xr); % Pasamos a filas

for i = 1:r - 1
    ev(:, i) = f(t(i), x(:, i));
end

% j0 y j indices circulares sobre ev
% j0 = f(t_i, x_i)
% j(k) = f(t_{i + k}, x_{i + k}), k = 1..r-1
j = zeros(r - 1);

for i = 1:N - r + 1
    j0 = mod(i + r - 1, r) + 1;
    for k = 1:r - 1
        j(k) = mod(i + k - 1, r) + 1;
    end
    ev(:, j(r - 1)) = f(t(i + r - 1), x(:, i + r - 1));
    
    x(:, i + 5) = x(:, i + 4) + (h / 720) * (1901 * ev(:, j(4)) - 2774 * ev(:, j(3)) + 2616 * ev(:, j(2)) - 1274 * ev(:, j(1)) + 251 * ev(:, j0));
end

t = t(:);  % Convertimos t en vector columna del tipo (N+1, 1)
x = transpose(x);  % x = x.';  % Convertimos la matriz x en una del tipo (N+1, n)


