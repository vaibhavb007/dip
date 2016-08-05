function [ ] = myNearestNeighbourInterpolation(imagePath, imageType)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

A = imagePath;
B = imread(A, imageType);
C = zeros(size(B,1)*3 - 2, size(B,2)*2-1);
C(1:3:end, 1:2:end) = B;
C(2:3:end, :) = C(1:3:end-1, :);
C(3:3:end, :) = C(4:3:end, :);

%%if interpolation:
C(:, 2:2:end) = (C(:, 1:2:end-1) + C(:, 3:2:end))/2;

figure('Name','barbaraSmall_nearest','NumberTitle','off'), imshow(C,[])
%save('../images/nearestneighbout.mat')
colorbar
axis on

figure('Name','barbaraSmall_original','NumberTitle','off'), imshow(B)
colorbar
axis on

end