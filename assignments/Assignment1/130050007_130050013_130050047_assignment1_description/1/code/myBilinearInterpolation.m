%% Function - myBilinearInterpolation
% MyBilinearInterpolation resizes image using Bilinear Interpolation
% method.

function [] = myBilinearInterpolation( filename )

input = imread(filename);
output = zeros(3*size(input,1)-2,2*size(input,2)-1);

output(1:3:end,1:2:end) = input;
output(1:1:end,2:2:end) = (output(1:1:end,1:2:end-1)+output(1:1:end,3:2:end))/2;
output(2:3:end,1:1:end) = (2*output(1:3:end-1,1:1:end)+output(4:3:end,1:1:end))/3;
output(3:3:end,1:1:end) = (output(1:3:end-1,1:1:end)+2*output(4:3:end,1:1:end))/3;

%Display Original image
Display('barbaraSmall_original',input,0);
%Display modified image
Display('barbaraSmall_bilinear',output,1);

end