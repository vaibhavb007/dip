%% MyMainScript

tic;
%% Your code here
% 
% myHE('barbara.png');
% myHE('canyon.png');
% myHE('TEM.png');

A = imread('../data/barbara.png');
B = myAHE(A,11);

figure, imshow(A, []);
figure, imshow(B, []);

toc;
