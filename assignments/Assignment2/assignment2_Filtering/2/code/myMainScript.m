%% Part 2 - Bilateral Filtering
% Showing effects of bilateral filter

tic;
optimal_sigma_d = 1.45;
optimal_sigma_r = 10;

A = load('../data/barbara.mat','-mat');
A = A.imageOrig;
% Display('barbaraOrig',A);

% Call function myBilateralFiltering.m which takes inputs - imageMatrix,
% sigma_r and sigma_d
[B,C] = bilateralFilter(A,optimal_sigma_d,optimal_sigma_r);

figure
subplot(1,3,1); Display(A);
subplot(1,3,2); Display(B);
subplot(1,3,3); Display(C);
toc;
