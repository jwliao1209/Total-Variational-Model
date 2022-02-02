clc; clear; close all;
addpath("figure\");
addpath("function\");

file = 'wood.jpg';

% parameter
alpha = 1.8;
beta = 1.2 * alpha;
gamma = 5 / 255;
delta = 5 / 255;
lambda = 0.0001;
tol = 1e-5;
maxIter = 100;

image = imread(file);

tic;
F = double(image) / 255;
u_sol = ContrastEnhancement(F, alpha, beta, gamma, delta, ...
    lambda, tol, maxIter);
time = toc;

%% Plot figure
figure;
subplot(1, 2, 1);
imshow(image);
title("Original Image");
subplot(1, 2, 2);
imshow(u_sol);
title("Enhancing Image");
fprintf("The time spending of ROF denosing is %.4d sec\n", time);
