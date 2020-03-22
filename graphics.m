dim = size(x, 2);
colors = ['r', 'g', 'b'];

if dim > 3 || dim < 1
    fprintf("x dimension not supported: %i\n", size(x, 2))
end

% Plot each coord separately
figure(1)
for i = 1:dim
    subplot(dim, 1, i)
    plot(t, x(:, i), colors(i))
    title(sprintf("Coord %d of the solution", i))
end

% Plot the trajectory of the solution
if dim > 1
    pause(2)
    figure(2)
    if dim == 2
        plot(x(:, 1), x(:, 2), 'r')
    else  % dim == 3
        plot3(x(:, 1), x(:, 2), x(:, 3), 'r')
    end
    title("Trajectory of the solution")
end