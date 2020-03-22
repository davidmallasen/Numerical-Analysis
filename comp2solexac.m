function comp2solexac(met)
%COMP2SOLEXAC Compares the input method with the exact solution (if known).
%   Executes the method and plots it vs the exact solution.

data

if ~exist('exact', 'var')
   fprintf("This problem has no exact solution defined\n")
   return;
end

[t, x1] = met(f, interval, x0, N);
x2 = exact(t);

dim = size(x1, 2);

if dim ~= size(x2, 2)
    fprintf("Dimension of x1 and x2 is different: %i %i\n", dim, size(x2, 2))
    return;
end

if dim > 3 || dim < 1
    fprintf("x dimension not supported: %i\n", size(x1, 2))
    return;
end

colors = ['r', 'g', 'b', 'm'];

% Plot each coord separately for both methods
figure(1)
for i = 1:dim
    subplot(dim, 1, i)
    plot(t, x1(:, i), colors(i))
    hold on
    plot(t, x2(:, i), colors(i + 1))
    legend('met', 'exact')
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
    legend('met', 'exact')
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

