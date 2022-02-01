function error = ComputeError(u_new, u_old)
error = ComputeMSE(u_new-u_old) / ComputeMSE(u_old);

end