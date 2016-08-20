%% Function - myAHE
% myAHE performs adaptive histogram
% equalization on the entire matrix. Calls adaptiveHistogram
% as a subroutine


function [output] = myAHE(input , windowSize)

    output = zeros(size(input,1),size(input,2),size(input,3));
    
    for i = 1:size(output,3)
        output(:,:,i) = nlfilter(input(:,:,i),'indexed',[windowSize windowSize],@adaptiveHistogram);
    end
    
    output = uint8(output);
    
end