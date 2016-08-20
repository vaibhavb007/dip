%% Function - myCLAHE
% myCLAHE performs contrast limited adaptive histogram
% equalization on the entire matrix. Calls adaptiveHistogramCutOff
% as a subroutine

function [output] = myCLAHE(input , windowSize, cutOff)

    columnCount = size(input,2);
    rowCount = size(input,1);
    output = zeros(rowCount,columnCount,size(input,3));
    f = @(A) adaptiveHistogramcutoff(A, cutOff);
    
    for i = 1:size(output,3)
        output(:,:,i) = nlfilter(input(:,:,i),'indexed',[windowSize windowSize],f);
    end
    
    output = uint8(output);
end