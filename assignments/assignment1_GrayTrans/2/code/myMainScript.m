%% MyMainScript

tic;
%% Your code here
% 

A = imread('../data/barbara.png');
B = myAHE(A,11);
tic;
figure, imshow(A, []);
figure, imshow(B, []);
toc;
