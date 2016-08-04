function [ ] = myShrinkImageByFactorD(n)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

A = '..\data\circles_concentric.png'
B = imread(A,'png');
C = B(1:n:end,1:n:end);

figure(1),imshow(B);
colorbar
axis on
figure(n),imshow(C);
save(strcat('shrink',int2str(n),'.mat'))
colorbar
axis on
end

