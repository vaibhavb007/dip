%% Part 2 - Contrast Adjustment
% In this section we experiment with various algorithms for contrast
% adjustment of images. For the color image, apply the analysis independently
% to each channel

tic;
%%% Linear Contrast Stretching
% Implements a linear grayscale transformation function to enhance the intensity 
%contrast such that the resulting intensity range is [0; 255].
% call to function myLinearContrastStretching
% Function takes image matrix as input.
A = imread('../data/barbara.png');
Display('barbara',A);

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


%%% Histogram Equalization
% Implements a histogram equalization function to improve image contrast 
% call to function myHE
% Function takes imagematrix as input
A = imread('../data/barbara.png');
Display('barbara',A);

B = myHE(A);
Display('barbara_HE',B);

A = imread('../data/canyon.png');
Display('canyon',A);

B = myHE(A);
Display('canyon_HE',B);

A = imread('../data/TEM.png');
Display('TEM',A);

B = myHE(A);
Display('TEM_HE',B);

%%% Adaptive Histogram Equalization
% Implements an adaptive histogram equalization function to improve image contrast 
% call to function myAHE
% Function takes image matrix and window size as input

A = imread('../data/barbara.png');
Display('barbara',A);

B = myAHE(A,161);
Display('barbara_AHE_optimal',B);

A = imread('../data/canyon.png');
Display('canyon',A);

B = myAHE(A,141);
Display('canyon_AHE_optimal',B);

A = imread('../data/TEM.png');
Display('TEM',A);

B = myAHE(A,87);
Display('TEM_AHE_optimal',B);

A = imread('../data/barbara.png');
Display('barbara',A);

B = myAHE(A,41);
Display('barbara_AHE_excessive_noise',B);

A = imread('../data/canyon.png');
Display('canyon',A);

B = myAHE(A,33);
Display('canyon_AHE_excessive_noise',B);

A = imread('../data/TEM.png');
Display('TEM',A);

B = myAHE(A,15);
Display('TEM_AHE_excessive_noise',B);

A = imread('../data/barbara.png');
Display('barbara',A);

B = myAHE(A,281);
Display('barbara_AHE_lowcontrast',B);

A = imread('../data/canyon.png');
Display('canyon',A);

B = myAHE(A,177);
Display('canyon_AHE_lowcontrast',B);

A = imread('../data/TEM.png');
Display('TEM',A);

B = myAHE(A,177);
Display('TEM_AHE_lowcontrast',B);

%%% Contrast Limited Adaptive Histogram Equalization
% Implements a contrast limited adaptive histogram equalization function to improve image contrast 
% call to function myCLAHE
% Function takes image matrix and window size as input

A = imread('../data/barbara.png');
Display('barbara',A);

B = myCLAHE(A,100,0.01);
Display('barbara_CLAHE',B);

A = imread('../data/canyon.png');
Display('canyon',A);

B = myCLAHE(A,80,0.01);
Display('canyon_CLAHE',B);

A = imread('../data/TEM.png');
Display('TEM',A);

B = myCLAHE(A,40,0.1);
Display('TEM_CLAHE',B);

A = imread('../data/barbara.png');
Display('barbara',A);

B = myCLAHE(A,100,0.005);
Display('barbara_CLAHE_half',B);

A = imread('../data/canyon.png');
Display('canyon',A);

B = myCLAHE(A,80,0.005);
Display('canyon_CLAHE_half',B);

A = imread('../data/TEM.png');
Display('TEM',A);

B = myCLAHE(A,40,0.05);
Display('TEM_CLAHE_half',B);

toc;
