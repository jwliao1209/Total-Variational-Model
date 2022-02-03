function gradx = Gradx(f, method)
[m, ~, c] = size(f);

switch method
    case "f"  % forward difference: Dx(n)=x(n+1)-x(n)
        gradx = [diff(f, 1, 2), zeros(m, 1, c)];

    case "b"  % backward difference: Dx(n)=x(n)-x(n-1)
        gradx = [zeros(m, 1, c), diff(f, 1, 2)];

end