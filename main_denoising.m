clc; clear; close all;
addpath("function\");

% parameter
sigma = 1e-2;  % gaussian noise
lambda = 10;
gamma = 5;
tol = 1e-6;
maxIter = 100;

file = 'dog.jpg';
image = rgb2gray(imread(file));  % convert image to grayscale
u_exact = double(image) / 255;

%% Denosing
tic;
f = imnoise(u_exact, 'gaussian', 0, sigma);  % generate noise
[u_sol, iter] = ROFDenoising(f, lambda, gamma, tol, maxIter);
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
