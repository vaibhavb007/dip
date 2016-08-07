%% MyMainScript

tic;
%% Your code here
% 
% myHE('barbara.png');
% myHE('canyon.png');
% myHE('TEM.png');

A = imread('../data/barbara.png');
B = myCLAHE(A,11);

figure, imshow(A, []);
figure, imshow(B, []);

toc;
