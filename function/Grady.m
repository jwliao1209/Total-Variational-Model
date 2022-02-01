function grady = Grady(f, type)
[~, n] = size(f);

switch type
    case "f"  % forward difference: Dy(n)=y(n+1)-y(n)
        grady = [diff(f, 1, 1); zeros(1, n)];

    case "b"  % backward difference: Dy(n)=y(n)-y(n-1)
        grady = [zeros(1, n); diff(f, 1, 1)];

end