function value = SoftThreshold(f, gamma)
value = sign(f) .* max(abs(f) - 1 / gamma, 0);

end
