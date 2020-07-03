intervalo = [0, pi];
x0 = 1;
N = 100;

h = (intervalo(2) - intervalo(1)) / N;

t = intervalo(1): h: intervalo(2);

x = zeros(N + 1);
x(1) = x0;
for i = 1:N
    x(i + 1) = (x(i) + (h/3) * x(i) + (h/3)*cos(t(i)) + (2*h/3) * cos(t(i+1))) / (1 - 2*h/3);
end

plot(t, x(:, 1))