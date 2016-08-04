function [ B ] = myBilinearInterpolation( A )
%MyBilinearInterpolation Resize image using Bilinear Interpolation
%   A matrix of image to be resized
%   B modified matrix
B = zeros(3*size(A,1)-2,2*size(A,2)-1);

B(1:3:end,1:2:end) = A;
B(1:1:end,2:2:end) = (B(1:1:end,1:2:end-1)+B(1:1:end,3:2:end))/2;
B(2:3:end,1:1:end) = (2*B(1:3:end-1,1:1:end)+B(4:3:end,1:1:end))/3;
B(3:3:end,1:1:end) = (B(1:3:end-1,1:1:end)+2*B(4:3:end,1:1:end))/3;
B = uint8(B);

end