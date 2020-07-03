% % Pr2 Ej1
% f = @(t, x) [x(2); -9*x(1) + 8*sin(t)]; 
% interval = [0, 2*pi];
% x0 = [0, 4];
% N = 1000;

% % Pr2 Ej1 Harmonic oscillator
% k = 1;
% m = 1;
% f = @(t, x) [x(2); -(k/m)*x(1)];
% interval = [0, 10];
% x0 = [1, 0];
% N = 1000;

% % Pr2 Ej1 Van der Pol equation
% alpha = 1;
% beta = 1;
% f = @(t, x) [x(2); -alpha*(x(1)^2 - beta)*x(2) - x(1)];
% interval = [0, 10];
% x0 = [0.1, 0.2];
% N = 1000;

% % Pr2 Ej11a
% f = @(t, x) [-0.1*x(1) + 2*x(2); -2*x(1) - 0.1*x(2)];
% interval = [0, 10];
% x0 = [0, 1];
% N = 1000;
% exact = @(t) [exp(-0.1*t).*sin(2*t), exp(-0.1*t).*cos(2*t)];

% % Pr2 Ej11b
% f = @(t, x) [x(2); cos(3*t) - 2*x(1)];
% interval = [0, 10];
% x0 = [1, 0];
% N = 1000;
% exact = @(t) [(8/7).*cos(sqrt(2).*t) - (1/7).*cos(3.*t), ((-8*sqrt(2))/7).*sin(sqrt(2).*t) + (3/7).*sin(3.*t)];

% % Pr2 Ej14 Pendulo
% L = 1;
% F = 1.1;
% m = 1;
% g = 9.8;
% beta = 0.5;
% theta0 = asin(1/g);
% w0 = 0;
% f = @(t, x) [x(2); (F/(m*L)) - ((2*beta)/m)*x(2) - (g/L)*sin(x(1))];
% % Pendulo linealizado
% % f = @(t, x) [x(2); -((2*beta)/m)*x(2) - (g/L)*x(1)];
% interval = [0, 10];
% x0 = [theta0, w0];
% N = 1000;

% % Pr2 Ej15ab depredador(x)-presa(y) (Lotka-Volterra)
% a0 = 1;
% b0 = 1;
% c0 = 1;
% d0 = 1;
% e0 = 0.4;
% f0 = 0.02;
% % f = @(t, x) [a0*x(1) - b0*x(1)*x(2); -c0*x(2) + d0*x(1)*x(2)];
% f = @(t, x) [a0*x(1) - b0*x(1)*x(2) - e0*x(1)^2; -c0*x(2) + d0*x(1)*x(2) - f0*x(2)^2];
% interval = [0, 100];
% x0 = [1, 20];
% N = 10000;

% % Pr2 Ej15d Duffing equation
% alpha = 1;
% f = @(t, x) [x(2); -alpha*x(2) - x(1)^3 + x(1)];
% interval = [0, 10];
% x0 = [-1, 1];
% N = 1000;

% % Pr2 Ej15e Lorentz
% sigma = 10;
% beta = 8/3;
% rho = 99.65;
% f = @(t, x) [sigma*(x(2) - x(1)); rho*x(1) - x(2) - x(1)*x(3); x(1)*x(2) - beta*x(3)];
% interval = [0, 10];
% x0 = [0, 5, 75];
% N = 10000;

% % Pr2 Ej16 Oscilador armonico forzado
% A = 1;
% a = 10;
% w = 12;
% beta = 15;
% f = @(t, x) [x(2); A*cos(w*t) - 2*beta*x(2) - a^2*x(1)];
% interval = [0, 10];
% x0 = [0, 0];
% N = 1000;

% % May 2018
% f = @(t, x) x + cos(t);
% interval = [0, pi];
% x0 = 1;
% N = 100;






