function [t, x] = meulermod(f, intervalo, x0, N)
% Explicit Modified Euler method.
%
% La funcion meulermod resuelve un problema de valor inicial de la forma
% x'=f(t,x) en [t0,T]
% x(t0)=x0,
% con x0 en R^n, mediante el metodo de Euler modificado (explicito).
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

x = zeros(dim, N + 1);
x(:, 1) = x0;
for i = 1:N
    F1 = f(t(i), x(:, i));
    F2 = f(t(i) + h / 2, x(:, i) + (h / 2) * F1);
    x(:, i + 1) = x(:, i) + h * F2;
end
t = t(:);  % Convertimos t en vector columna del tipo (N+1, 1)
x = transpose(x);  % x = x.';  % Convertimos la matriz x en una del tipo (N+1, n)
