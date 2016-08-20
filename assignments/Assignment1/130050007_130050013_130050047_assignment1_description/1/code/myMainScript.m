%% Part 1 : Resizing Images
%%
tic;
%%% Image Shrinking using Subsampling
% Call function myShrinkImageByFactorD
% Function takes input _d_ which is to be used as shrinking factor
myShrinkImageByFactorD(2);
myShrinkImageByFactorD(3);

%%% Image Enlargement using Bilinear Interpolation
% Call to function myBilinearInterpolation
%. The Function takes image file path _filename_ as input
myBilinearInterpolation('../data/barbaraSmall.png');

%%% Image Enlargement using Nearest-Neighbor Interpolation
% Call function myNearestNeighbourInterpolation
% Function takes inputs _imagePath_ and _imageType_
myNearestNeighbourInterpolation('../data/barbaraSmall.png','png');

toc;
