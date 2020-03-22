function comp2ode45(met)
%COMP2MET Compares the input method with ode45.
%   Executes both methods and plots them.

data

[t, x1] = met(f, interval, x0, N);
[~, x2] = ode45(f, t, x0);

dim = size(x1, 2);

if dim ~= size(x2, 2)
    fprintf("Dimension of x1 and x2 is different: %i %i\n", dim, size(x2, 2))
end

if dim > 3 || dim < 1
    fprintf("x dimension not supported: %i\n", size(x1, 2))
end

colors = ['r', 'g', 'b', 'm'];

% Plot each coord separately for both methods
figure(1)
for i = 1:dim
    subplot(dim, 1, i)
    plot(t, x1(:, i), colors(i))
    hold on
    plot(t, x2(:, i), colors(i + 1))
    legend('met', 'ode45')
    title(sprintf("Coord %d of the solution", i))
end

pause(2)

% Plot the difference between both methods
figure(2)
for i = 1:dim
    subplot(dim, 1, i)
    plot(t, x1(:, i) - x2(:, i), colors(i))
    hold on
    yline(0, 'k');
    title(sprintf("Difference in coord %d of the solution", i))
end

% Plot the trajectory of both solutions
if dim > 1
    pause(2)
    figure(3)
    if dim == 2
        plot(x1(:, 1), x1(:, 2), colors(1))
        hold on
        plot(x2(:, 1), x2(:, 2), colors(2))
    else  % dim == 3
        plot(x1(:, 1), x1(:, 2), x1(:, 3), colors(1))
        hold on
        plot(x2(:, 1), x2(:, 2), x2(:, 3), colors(2))
    end
    legend('met', 'ode45')
    title("Trajectory of the solutions")
end

pause(2)

% Plot the inf norm of the difference between both solutions
inf_norm = max(max(abs(x1 - x2)));

figure(4)

yline(inf_norm, 'k');
legend(sprintf("%d", inf_norm))
title("Inf norm of the difference between both solutions")

end

