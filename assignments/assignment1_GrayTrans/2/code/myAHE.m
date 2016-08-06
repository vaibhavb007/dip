function [output] = myAHE(input , windowSize)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    columnCount = size(input,2);
    rowCount = size(input,1);
    output = zeros(rowCount,columnCount,size(input,3));

    for i = 1:size(output,3)
        output(:,:,i) = colfilt(input(:,:,i),'indexed',[windowSize windowSize],'sliding',@adaptiveHistogram);
        waitbar(0)
    end

end