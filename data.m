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

% Pr2 Ej1 Van der Pol equation
% alpha = 1;
% beta = 1;
% f = @(t, x) [x(2); -alpha*(x(1)^2 - beta)*x(2) - x(1)];
% interval = [0, 10];
% x0 = [0.1, 0.2];
% N = 1000;