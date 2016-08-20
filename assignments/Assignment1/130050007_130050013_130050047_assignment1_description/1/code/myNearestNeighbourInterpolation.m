%% Function - myNearestNeighbourInterpolation
% The function uses Nearest Neighbour Interpolation technique for enlarging
% the image. The newly added pixels in the enlarged image get their
% intensity same as their nearest neighbour

function [ ] = myNearestNeighbourInterpolation(imagePath, imageType)

B = imread(imagePath, imageType);
C = zeros(size(B,1)*3 - 2, size(B,2)*2-1);
C(1:3:end, 1:2:end) = B;
C(2:3:end, :) = C(1:3:end-1, :);
C(3:3:end, :) = C(4:3:end, :);

C(:, 2:2:end) = (C(:, 1:2:end-1) + C(:, 3:2:end))/2;

%Display original image
Display('barbaraSmall_original',B,0);
%Display modified image
Display('barbaraSmall_nearest',C,1);

end