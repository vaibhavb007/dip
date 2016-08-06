%% MyMainScript

tic;
%% Your code here
% 

A = imread('../data/barbara.png');
figure, imshow(A, []);

tic;
B = myAHE(A,151);
figure, imshow(B, []);
toc;