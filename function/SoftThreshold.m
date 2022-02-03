function X = SoftThreshold(B, lambda)
% X = argmax(||X-B||_2^2 + lambda ||X||_1)
X = sign(B) .* max(abs(B) - lambda, 0);

end
