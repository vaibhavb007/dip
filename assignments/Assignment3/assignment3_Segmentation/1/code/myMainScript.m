%% MyMainScript

tic;
%% Your code here
%A = imread('../data/images.png', 'png');
%A = double(A);
A = load('../data/boat.mat');
A = A.imageOrig;
optimalFirstSmoothing = 0.001;
optimalSecondSmoothing = 1.5;
B = [-1,0,0; 0,-1,0; 0,0,-1; 0,0,1];
C = [0;0;0;0.25];
X0 = [0.001;1.5;0.1];
myHarrisCornerDetector(X0);

% X = fmincon(f,X0,B,C);


toc;
