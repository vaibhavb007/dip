%% MyMainScript

tic;
%% Your code here
% 

A = imread('../data/barbara.png');
B = myCLAHE(A,11);

figure, imshow(A, []);

tic;
B = myAHE(A,151);
figure, imshow(B, []);
toc;
