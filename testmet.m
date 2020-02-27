function testmet(method_)
%TESTMET Tests the input method.
%   Imports data, executes the input method and plots the solution.

data

[t, x] = method_(f, interval, x0, N);

graphics

end

