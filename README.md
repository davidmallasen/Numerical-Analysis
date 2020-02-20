# Numerical-Analysis
Some numerical analysis algorithms in MATLAB.

## To solve a new initial value problem:

x' = f(t, x) in [t0, T]
x(t0) = x0, with x0 in R^n

1. Add the problem to the data.m file. 
   - f: Function that defines the initial value problem.
   - interval: Interval of definition of f.
   - x0: Initial value of the solution.
   - N: Number of approximation points in the interval.
2. Call the corresponding test*.m script with the method with which to solve the specified problem.