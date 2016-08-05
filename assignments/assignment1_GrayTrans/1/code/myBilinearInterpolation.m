function [] = myBilinearInterpolation( filename )
%MyBilinearInterpolation Resize image using Bilinear Interpolation
%   A matrix of image to be resized
%   B modified matrix

input = imread(filename);
output = zeros(3*size(input,1)-2,2*size(input,2)-1);

output(1:3:end,1:2:end) = input;
output(1:1:end,2:2:end) = (output(1:1:end,1:2:end-1)+output(1:1:end,3:2:end))/2;
output(2:3:end,1:1:end) = (2*output(1:3:end-1,1:1:end)+output(4:3:end,1:1:end))/3;
output(3:3:end,1:1:end) = (output(1:3:end-1,1:1:end)+2*output(4:3:end,1:1:end))/3;

figure('Name','barbaraSmall_original','NumberTitle','off'),imshow(input)
colorbar
axis on

figure('Name','barbaraSmall_bilinear','NumberTitle','off'),imshow(output,[])
colorbar
axis on

end