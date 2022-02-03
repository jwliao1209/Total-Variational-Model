function grady = Grady(f, method)
[~, n, c] = size(f);

switch method
    case "f"  % forward difference: Dy(n)=y(n+1)-y(n)
        grady = [diff(f, 1, 1); zeros(1, n, c)];

    case "b"  % backward difference: Dy(n)=y(n)-y(n-1)
        grady = [zeros(1, n, c); diff(f, 1, 1)];

end