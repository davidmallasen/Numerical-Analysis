function [t, x] = mab4(f, intervalo, x0, N)
% Metodo de Adams-Bashforth de 4 pasos.
%
% La funcion mab2 resuelve un problema de valor inicial de la forma
% x'=f(t,x) en [t0,T]
% x(t0)=x0,
% con x0 en R^n, mediante el metodo de Adams-Bashforth de 4 pasos.
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

x0 = x0(:);
dim = size(x0, 1);
h = (intervalo(2) - intervalo(1)) / N;
t = intervalo(1): h: intervalo(2);

% Calculamos los r-1 primeros valores
[~, xr] = mrk3(f, [t(1), t(4)], x0, 3);

x = zeros(dim, N + 1);
ev = zeros(dim, 4); % Guardamos las evaluaciones de f

x(:, 1:4) = transpose(xr); % Pasamos a filas
ev(:, 1) = f(t(1), x(:, 1));
ev(:, 2) = f(t(2), x(:, 2));
ev(:, 3) = f(t(3), x(:, 3));
for i = 1:N - 3
    % Indices circulares sobre ev
    j0 = mod(i + 3, 4) + 1;
    j1 = mod(i, 4) + 1;
    j2 = mod(i + 1, 4) + 1;
    j3 = mod(i + 2, 4) + 1;
    ev(:, j3) = f(t(i + 3), x(:, i + 3));
    
    x(:, i + 4) = x(:, i + 3) + (h / 24) * (55 * ev(:, j3) - 59 * ev(:, j2) + 37 * ev(:, j1) - 9 * ev(:, j0));
end

t = t(:);  % Convertimos t en vector columna del tipo (N+1, 1)
x = transpose(x);  % x = x.';  % Convertimos la matriz x en una del tipo (N+1, n)


