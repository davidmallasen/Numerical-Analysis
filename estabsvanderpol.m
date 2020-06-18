% Van der Pol equation
alpha = 0.1;
beta = 1;
T = 150;
f = @(t, x) [x(2); -alpha*(x(1)^2 - beta)*x(2) - x(1)];
interval = [0, T];
x0 = [0.1, 0.1];
tol = 1.e-5;

% ode45 ======================
opciones = odeset('Stats', 'off', 'AbsTol', tol, 'RelTol', tol);
[t1, x1] = ode45(f, interval, x0, opciones);

figure
plot(x1(:, 1), x1(:, 2), 'b')
title('ode45')

% ode15s =====================
opciones = odeset('Stats', 'off', 'AbsTol', tol, 'RelTol', tol);
[t2, x2] = ode15s(f, interval, x0, opciones);

figure
plot(x2(:, 1), x2(:, 2), 'r')
title('ode15s')

% Comparar pasos =============
s1 = 1:length(t1) - 1;
y1 = diff(t1);
pasos1 = sprintf('ode45: %d pasos', length(s1));

s2 = 1:length(t2) - 1;
y2 = diff(t2);
pasos2 = sprintf('ode15s: %d pasos', length(s2));

figure
plot(s1, y1, 'b', s2, y2, 'r')
legend(pasos1, pasos2)
