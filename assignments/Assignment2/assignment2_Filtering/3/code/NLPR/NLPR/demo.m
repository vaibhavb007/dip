% demo on Non-Local Patch Regression
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  img      : clean grayscale image
%  h        : width of Gaussian
%  P        : half-size of patch
%  S        : half-search window
%
%  Author:    Kunal N. Chaudhury
%  Date:      Dec 1, 2012
%
%  Reference:
%  K. N. Chaudhury, A. Singer, "Non-Local Patch Regression:
%  Robust image denoising in patch space", IEEE International
%  Conference on Acoustics, Speech, and Signal Processing, 2013.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clear all; close all force;

% clean image
img    = double(imread('ckb.jpg'));
[m, n] = size(img);

% add noise
sigma     =  40;
imgNoisy  =  img  +  sigma * randn(m,n);

% NLEM parameters
p  = 0.1;
S  = 10;
P  = 3;
h  = 10 * sigma;

% call NELM (or NLEM_kNN)
imgDenoised = NLPR(imgNoisy, h, P, S, p);


% show results
peak  = max(max(img));
PSNR0 = 10 * log10(m * n * peak^2 / sum(sum((imgNoisy - img).^2)) );
PSNR1 = 10 * log10(m * n * peak^2 / sum(sum((imgDenoised - img).^2)) );

figure('Units','normalized','Position',[0 0.5 1 0.5]);
colormap gray,
subplot(1,3,1), imagesc(img),
title('Original', 'FontSize', 10), axis('image', 'off');
subplot(1,3,2), imagesc(imgNoisy),
title([ 'Noisy, ', num2str(PSNR0, '%.2f'), 'dB'] , 'FontSize', 10),
axis('image', 'off');
subplot(1,3,3), imagesc(imgDenoised),
title([ 'NLEM filtered, ', num2str(PSNR1, '%.2f'), 'dB'] , 'FontSize', 10),
axis('image', 'off');
