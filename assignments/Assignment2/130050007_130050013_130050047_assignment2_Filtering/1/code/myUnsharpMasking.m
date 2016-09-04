%% Function - myUnsharpMasking
% Function to apply unmask filter by first
% calculating difference of gausian filter and
% adding a scale of it to original image

function [ A ] = myUnsharpMasking(B , sigma, scale)

H = fspecial('gaussian',[10 10],sigma);
FcG = imfilter(B,H,'circular');
DoG = B - FcG;
A = B + scale*DoG;

end

