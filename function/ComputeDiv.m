function div = ComputeDiv(Fi, Fj, method)
Fx = Gradx(Fi, method);
Fy = Grady(Fj, method);
div = Fx + Fy;

end