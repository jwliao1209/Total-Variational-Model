function u_sol = ROFDenoising(F, lambda, gamma, tol, maxIter)

[m, n, c] = size(F);
u_sol = zeros(m, n, c);

for k = 1:c
    f = F(:, :, k);
    iter = 0;
    relativeError = Inf;

    % Initial
    u = f;
    bx = zeros(m, n);
    by = zeros(m, n);
    dx = zeros(m, n);
    dy = zeros(m, n);

    while iter < maxIter && relativeError > tol
        % Updating u by poisson pde with Neumann BC
        alpha = lambda / gamma;
        div_db = ComputeDiv(dx - bx, dy - by, "b");
        rhs = alpha*f - div_db;
        u_tmp = SolvePoissonPDE(u, rhs, alpha);

        % Updating d by soft-thresholding
        [ux, uy] = ComputeGrad(u_tmp, "f");
        dx = SoftThreshold(ux + bx, 1 / gamma);
        dy = SoftThreshold(uy + by, 1 / gamma);

        % Updating b
        bx = bx + ux - dx;
        by = by + uy - dy;

        % Compute the relative error
        relativeError = ComputeError(u_tmp, u);
        iter = iter + 1;
        u = u_tmp;
    end
    u_sol(:, :, k) = u;
end

end