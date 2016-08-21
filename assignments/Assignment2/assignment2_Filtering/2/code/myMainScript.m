%% MyMainScript

tic;
%% Your code here
A = load('../data/barbara.mat','-mat');
A = A.imageOrig;
%Display('1',A);
bilateralFilter(A);
toc;
