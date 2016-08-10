%% Function - myShrinkImageByFactorD
% The function shrinks original image by a factor of D by subsampling
% pixels from the original matrix.

function [ ] = myShrinkImageByFactorD(d)
A = '../data/circles_concentric.png';
B = imread(A,'png');
C = B(1:d:end,1:d:end);

% Display Original image
Display('circles_concentric_original',B,0);
% Display shrinked image
Display(strcat('circles_concentric_shrinked_',int2str(d)),C,0);
end

