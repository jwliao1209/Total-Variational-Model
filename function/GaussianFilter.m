function h = GaussianFilter(f, sigma)
filterSize = round(2 * sigma + 1);
filter = fspecial('gaussian', filterSize, sigma);
h = conv2(f, filter, 'same');

end
