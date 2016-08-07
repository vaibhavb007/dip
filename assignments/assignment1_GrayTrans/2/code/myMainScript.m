%% MyMainScript

tic;
%% Your code here
% 
tic;
A = imread('../data/barbara.png');
B = myCLAHE(A,10);

figure, imshow(A, []);
figure, imshow(B, []);
toc;
