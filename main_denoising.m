clc; clear; close all;
addpath("figure\");
addpath("function\");

file = 'lenna.jpg';

% parameter
grayscale = true;
resize = true;
sigma = 5e-3;  % gaussian noise
lambda = 10;
gamma = 5;
tol = 1e-6;
maxIter = 100;

if grayscale
    image = rgb2gray(imread(file));
else
    image = imread(file);
end

if resize
    image = imresize(image, [512 512]);
end

u_exact = double(image) / 255;
f = imnoise(u_exact, 'gaussian', 0, sigma);  % generate noise

%% Denosing
tic;
u_sol = ROFDenoising(f, lambda, gamma, tol, maxIter);
psnr = ComputePSNR(u_sol, u_exact);
time = toc;

%% Plot figure
figure;
subplot(2, 2, 1);
imshow(u_exact);
title("Original Image");
subplot(2, 2, 2);
imshow(f);
title("Noisy Image");
subplot(2, 2, 3);
imshow(u_sol);
title("ROF Denoising");
subplot(2, 2, 4);
imshow((u_sol-u_exact)*10);
title("Differece between origin and denoising");
fprintf("The PSNR of denosing image is %.4d\n", psnr);
fprintf("The time spending of ROF denosing is %.4d sec\n", time);

%% Compare with difference lambda
clc; figure;
ts = TightSubplot(2, 3, [0.05 0.01], [0.03 0.05], [0.06 0.06]);
Lambda = [5, 10, 15, 20];

axes(ts(1));
imshow(u_exact);
title("Original image", "Interpreter", "latex", "FontSize", 14);

axes(ts(2));
imshow(f);
txt = "Noisy image with $\sigma=\,$" + num2str(sigma);
title(txt, "Interpreter", "latex", "FontSize", 14);

for k = 1:4
    u_sol = ROFDenoising(f, Lambda(k), gamma, tol, maxIter);
    psnr = ComputePSNR(u_sol, u_exact);

    axes(ts(k+2));
    imshow(u_sol);
    txt = "$\lambda=\,$" + num2str(Lambda(k)) +...
        ", PSNR$=\,$" + num2str(psnr);
    title(txt, "Interpreter", "latex", "FontSize", 14)
    fprintf("The PSNR of denosing image with lambda = %d is %.4d\n", ...
        Lambda(k), psnr);
end
