function mse = ComputeMSE(u)
mse = mean(u.^2, 'all');

end