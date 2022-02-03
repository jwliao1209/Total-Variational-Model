function u_sol = SolvePoissonPDE(u, rhs, lambda)
% Poisson PDE: -Laplacian(u) + lambda * u = rhs
u_sol = (Laplacian(u) + 8 * u + rhs) / (lambda + 8);

end