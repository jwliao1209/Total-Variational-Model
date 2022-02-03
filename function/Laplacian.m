function L = Laplacian(f)
% Laplacian(u) = u(i-1,j) + u(i,j-1) + u(i+1,j) + u(i,j+1) - 4*u(i,j)
L = Gradx(f, "f") - Gradx(f, "b") + Grady(f, "f") - Grady(f, "b");

end