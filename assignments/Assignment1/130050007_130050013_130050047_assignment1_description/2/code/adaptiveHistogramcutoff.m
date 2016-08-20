%% Function - adaptiveHistogramcutoff
% adaptiveHistogramcutoff performs contrast limitedadaptive histogram
% equalization on a particular channel.

function [ x ] = adaptiveHistogramcutoff( A , cutOff)

fractions = histcounts(A,0:1:256)/(size(A,1)*size(A,2));
abovecutoff = fractions > cutOff;
total = sum(fractions(abovecutoff) - cutOff);
fractions(abovecutoff) = cutOff;
fractions = fractions + (total/256);
intensity = A((size(A,1))/2,(size(A,2))/2);
x = sum(fractions(1:intensity+1))*255;

end

