function psnr = ComputePSNR(u_sol, u_exact)
M = max(u_exact, [], 'all');
psnr = 10 * log10(M^2 / ComputeMSE(u_sol-u_exact));

end