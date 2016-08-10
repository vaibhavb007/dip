%% Part 2 - Contrast Adjustment
% In this section we experiment with various algorithms for contrast
% adjustment of images. For the color image, apply the analysis independently
% to each channel

tic;
A = imread('../data/barbara.png');
Display('barbara',A);
%%% Linear Contrast Stretching
% Implements a linear grayscale transformation function to enhance the intensity 
%contrast such that the resulting intensity range is [0; 255].

B = myLinearContrastStretching(A);
Display('BarbaraLinearContrast',B);

A = imread('../data/canyon.png');
Display('canyon',A);

B = myLinearContrastStretching(A);
Display('CanyonLinearContrast',B);

A = imread('../data/TEM.png');
Display('tem',A);

B = myLinearContrastStretching(A);
Display('TemLinearContrast',B);

toc;
