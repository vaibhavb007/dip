function [ x ] = adaptiveHistogramcutoff( input )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%A = imread('../data/barbara.png');
h = histogram(A,256);
fractions = h.Values/(size(A,1)*size(A,2));
abovecutoff = fractions > 0.005;
total = sum(fractions(abovecutoff) - 0.005);
fractions(abovecutoff) = 0.005;
fractions = fractions + (total/256);
intensity = A((size(A,1))/2,(size(A,2))/2);
x = sum(fractions(1:intensity+1))*255;
disp(intensity);
disp(x);
end

