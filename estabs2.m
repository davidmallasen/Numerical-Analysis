% Datos iniciales
mu = 50;
intervalo = [0, 1];
x0 = 0;
exact = @(t) (mu^2 / (1 + mu^2)) * (cos(t) - exp(-mu .* t) + sin(t) / mu);
N = 24;

% Aplicamos el metodo de Euler implicito
dim = size(x0, 1);
h = (intervalo(2) - intervalo(1)) / N;
t = intervalo(1): h: intervalo(2);

x = zeros(1, N + 1);
x(:, 1) = x0;
for i = 1:N
    x(:, i + 1) = (x(:, i) + mu * h * cos(t(i + 1))) / (1 + h * mu);
end
t = t(:);  % Convertimos t en vector columna del tipo (N+1, 1)
x = transpose(x);

% Representamos graficamente el resultado junto con la solucion exacta
hold on
plot(t, x)
plot(t, exact(t))
legend('eul\_imp', 'exact')