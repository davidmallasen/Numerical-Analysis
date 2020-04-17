function [t, x] = mab2(f, intervalo, x0, N)
% Metodo de Adams-Bashforth de 2 pasos.
%
% La funcion mab2 resuelve un problema de valor inicial de la forma
% x'=f(t,x) en [t0,T]
% x(t0)=x0,
% con x0 en R^n, mediante el metodo de Adams-Bashforth de 2 pasos.
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
[~, xr] = meuler(f, [t(1), t(2)], x0, 1);

x = zeros(dim, N + 1);
eval = zeros(dim, 2); % Guardamos las evaluaciones de f

x(:, 1:2) = transpose(xr); % Pasamos a filas
eval(:, 1) = f(t(1), x(:, 1));
for i = 1:N - 1
    % Indices circulares sobre eval
    j = mod(i, 2) + 1;
    k = mod(i + 1, 2) + 1;
    eval(:, j) = f(t(i + 1), x(:, i + 1));
    
    x(:, i + 2) = x(:, i + 1) + (h / 2) * (3 * eval(:, j) - eval(:, k));
end

t = t(:);  % Convertimos t en vector columna del tipo (N+1, 1)
x = transpose(x);  % x = x.';  % Convertimos la matriz x en una del tipo (N+1, n)


