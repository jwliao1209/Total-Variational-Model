function gradx = Gradx(f, type)
[m, ~] = size(f);

switch type
    case "f"  % forward difference: Dx(n)=x(n+1)-x(n)
        gradx = [diff(f, 1, 2), zeros(m, 1)];

    case "b"  % backward difference: Dx(n)=x(n)-x(n-1)
        gradx = [zeros(m, 1), diff(f, 1, 2)];

end