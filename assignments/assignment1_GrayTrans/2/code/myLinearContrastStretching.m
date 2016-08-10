function [] = myLinearContrastStretching()
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
Im = imread('..\data\barbara.png','png');
imshow(Im);
handle = image(Im);
imgmodel = imagemodel(handle);
str = getImageType(imgmodel);
if strcmp(str,'truecolor')
    redchannel = Im(:,:,1);
    greenchannel = Im(:,:,2);
    bluechannel = Im(:,:,3);
else disp('no');
end

