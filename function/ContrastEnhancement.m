function u_sol = ContrastEnhancement(F, alpha, beta, gamma, delta, lambda, tol, maxIter)

[m, n, channel] = size(F);
u_sol = zeros(m, n, channel);
fmax = max(F, [], 3);
fmaxBar = mean(fmax, "all");
omega_d = (fmax <= fmaxBar);  % dark region
omega_b = (fmax > fmaxBar);  % bridght region
Smin = 0; Smax = 1;
lambda = lambda / gamma;
delta = delta / gamma;

for k = 1 : channel
    f = F(:, :, k);
    [fx, fy] = ComputeGrad(f, "f");
    fBar = mean(f, "all");
    
    iter = 0;
    relativeError = Inf;

    % initial
    u = f;
    v = f;
    dx = zeros(m, n);
    dy = zeros(m, n);
    bx = zeros(m, n);
    by = zeros(m, n);
    c  = zeros(m, n);

    g = (alpha * fBar) .* omega_d + f .* omega_b;
    hc = GaussianFilter(beta * omega_d + omega_b, 5);
    h = hc .* f;
    [hx, hy] = ComputeGrad(h, "f");
    hx(omega_b) = fx(omega_b);
    hy(omega_b) = fy(omega_b);

    while iter < maxIter && relativeError > tol
        % Updating u by poisson pde
        div_dhb = ComputeDiv(dx + hx - bx, dy + hy - by, "b");
        rhs = lambda * g - div_dhb + delta * (v-c);
        u_tmp = SolvePoissonPDE(u, rhs, lambda + delta);

        % Updating d by 2 norm closed-form
        [ux, uy] = ComputeGrad(u_tmp, "f");
        dx = (ux - hx + bx) * gamma / (gamma + 1);
        dy = (uy - hy + by) * gamma / (gamma + 1);

        % Updating v by projecting to [0, 255]
        v = min(Smax, max(Smin, u_tmp + c));

        % Updating b
        bx = bx + ux - hx - dx;
        by = by + uy - hy - dy;

        % Updating c
        c = c + u_tmp - v;

        % Compute the relative error
        relativeError = ComputeError(u_tmp, u);
        iter = iter + 1;
        u = u_tmp;
    end
    u = min(Smax, max(Smin, u));
    u_sol(:, :, k) = u;

end
end