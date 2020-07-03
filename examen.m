f = @(t,x) 2 * x * (5 - x);
intervalo = [0, 2];
N = 200;
exacta = @(t) 15 ./ (3 + (2 * exp(-10 .* t)));
x0 = 3;

h = (intervalo(2) - intervalo(1)) / N;
t = intervalo(1): h: intervalo(2);

x1 = x0 + h * f(t(1), x0);

x = zeros(1, N + 1);

x(1) = x0;
x(2) = x1;

for i = 1:N - 1
    % Prediccion. Desplazados los indices
    x(i + 2) = x(i + 1) + h * f(t(i + 1), x(i + 1));
    
    % Evaluacion
    tmp_ev = f(t(i + 2), x(i + 2));
    
    % Correccion
    x(i + 2) = (4/3) * x(i + 1) - (1/3) * x(i) + (2 * h / 3) * tmp_ev;
end

x_exact = exacta(t);

figure(1)
plot(t, x)
hold on
plot(t, x_exact)
legend('met', 'exact')

inf_norm = max(max(abs(x_exact - x)));

figure(2)
yline(inf_norm, 'k');
legend(sprintf("Max error: %d", inf_norm))