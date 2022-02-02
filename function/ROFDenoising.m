function u_sol = ROFDenoising(F, lambda, gamma, tol, maxIter)

[m, n, channel] = size(F);
u_sol = zeros(m, n, channel);

for k = 1:channel
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
        Grad = Gradx(dx - bx, "b") + Grady(dy - by, "b");
        c = alpha*f - Grad;
        u_tmp = (c + Laplacian(u) + 8 * u) / (alpha + 8);

        % Updating d by soft-thresholding
        ux = Gradx(u_tmp, "f");
        uy = Grady(u_tmp, "f");
        dx = SoftThreshold(ux + bx, gamma);
        dy = SoftThreshold(uy + by, gamma);

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