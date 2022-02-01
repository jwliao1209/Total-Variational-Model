function [u_sol, iter] = ROFDenoising(f, lambda, gamma, tol, maxIter)

% Split Bregman Algorithm

[m, n] = size(f);
iter = 0;
relativeError = Inf;

% Initial
u_sol = f;
bx = zeros(m, n);
by = zeros(m, n);
dx = zeros(m, n);
dy = zeros(m, n);

while iter < maxIter && relativeError > tol
    % Updating u by poisson pde with Neumann BC
    alpha = lambda / gamma;
    Grad = Gradx(dx - bx, "b") + Grady(dy - by, "b");
    c = alpha*f - Grad;
    u_tmp = (c + Laplacian(u_sol) + 8 * u_sol) / (alpha + 8);

    % Updating d by soft-thresholding
    ux = Gradx(u_tmp, "f");
    uy = Grady(u_tmp, "f");
    dx = SoftThreshold(ux + bx, gamma);
    dy = SoftThreshold(uy + by, gamma);

    % Updating b
    bx = bx + ux - dx;
    by = by + uy - dy;

    % Compute the relative error
    relativeError = ComputeError(u_tmp, u_sol);
    iter = iter + 1;
    u_sol = u_tmp;
end


end