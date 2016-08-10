function [output] = myCLAHE(input , windowSize, cutOff)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    columnCount = size(input,2);
    rowCount = size(input,1);
    output = zeros(rowCount,columnCount,size(input,3));
    f = @(A) adaptiveHistogramcutoff(A, cutOff);
    
    for i = 1:size(output,3)
        output(:,:,i) = nlfilter(input(:,:,i),'indexed',[windowSize windowSize],f);
    end
    
    if size(input,3) == 3
        output = uint8(output);
    end
end