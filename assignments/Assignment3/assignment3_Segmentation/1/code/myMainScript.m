%% MyMainScript

tic;
%% Your code here
%A = imread('../data/images.png', 'png');
%A = double(A);
A = load('../data/boat.mat');
A = A.imageOrig;
optimalFirstSmoothing = 0.001;
optimalSecondSmoothing = 1.5;

myHarrisCornerDetector(A, optimalFirstSmoothing, optimalSecondSmoothing, 0.1);
toc;
