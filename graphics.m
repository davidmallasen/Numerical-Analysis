if size(x, 2) == 1
    plot(t, x)
elseif size(x, 2) == 2
    figure(1)
    subplot(2, 1, 1)
    plot(t, x(:, 1))
    subplot(2, 1, 2)
    plot(t, x(:, 2))
    
    pause(2)
    
    figure(2)
    plot(x(:, 1), x(:, 2))
elseif size(x, 2) == 3
    figure(1)
    subplot(3, 1, 1)
    plot(t, x(:, 1))
    subplot(3, 1, 2)
    plot(t, x(:, 2))
    subplot(3, 1, 3)
    plot(t, x(:, 3))
    
    pause(2)
    
    figure(2)
    plot3(x(:, 1), x(:, 2), x(:, 3))
else
    fprintf("x dimension not supported: %i\n", size(x, 2))
end