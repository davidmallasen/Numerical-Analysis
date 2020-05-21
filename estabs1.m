% Datos iniciales
mu = 50;
f = @(t, x) -mu * (x(1) - cos(t));
intervalo = [0, 1];
x0 = 0;
exact = @(t) (mu^2 / (1 + mu^2)) * (cos(t) - exp(-mu .* t) + sin(t) / mu);

% Aplicamos el metodo de Euler explicito para N = 24 y N = 26
[t1, x1] = meuler(f, intervalo, x0, 24);

[t2, x2] = meuler(f, intervalo, x0, 26);

% Representamos graficamente ambos resultados junto con la solucion exacta
hold on
plot(t1, x1)
plot(t2, x2)
plot(t2, exact(t2))
legend('N = 24', 'N = 26', 'exact')