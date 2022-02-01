function L = Laplacian(f)
L = Gradx(f, "f") - Gradx(f, "b") + Grady(f, "f") - Grady(f, "b");

end