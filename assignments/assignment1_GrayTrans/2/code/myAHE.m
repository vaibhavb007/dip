function [output] = myAHE(input , windowSize)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    output = zeros(size(input,1),size(input,2),size(input,3));
    
    for i = 1:size(output,3)
        output(:,:,i) = nlfilter(input(:,:,i),'indexed',[windowSize windowSize],@adaptiveHistogram);
    end
    
    if size(input,3) == 3
        output = uint8(output);
    end
    
end