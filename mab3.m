function [t, x] = mab3(f, intervalo, x0, N)
% Metodo de Adams-Bashforth de 3 pasos.
%
% La funcion mab2 resuelve un problema de valor inicial de la forma
% x'=f(t,x) en [t0,T]
% x(t0)=x0,
% con x0 en R^n, mediante el metodo de Adams-Bashforth de 3 pasos.
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
[~, xr] = meulermej(f, [t(1), t(3)], x0, 2);

x = zeros(dim, N + 1);
ev = zeros(dim, 3); % Guardamos las evaluaciones de f

x(:, 1:3) = transpose(xr); % Pasamos a filas
ev(:, 1) = f(t(1), x(:, 1));
ev(:, 2) = f(t(2), x(:, 2));
for i = 1:N - 2
    % Indices circulares sobre ev
    j0 = mod(i + 2, 3) + 1;
    j1 = mod(i, 3) + 1;
    j2 = mod(i + 1, 3) + 1;
    ev(:, j2) = f(t(i + 2), x(:, i + 2));
    
    x(:, i + 3) = x(:, i + 2) + (h / 12) * (23 * ev(:, j2) - 16 * ev(:, j1) + 5 * ev(:, j0));
end

t = t(:);  % Convertimos t en vector columna del tipo (N+1, 1)
x = transpose(x);  % x = x.';  % Convertimos la matriz x en una del tipo (N+1, n)


