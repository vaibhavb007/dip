%% MyMainScript

tic;
%% Your code here
% 
tic;
A = imread('../data/barbara.png');
B = myCLAHE(A,10);

figure(1), imshow(A, []);
figure(2), imshow(B, []);
toc;
