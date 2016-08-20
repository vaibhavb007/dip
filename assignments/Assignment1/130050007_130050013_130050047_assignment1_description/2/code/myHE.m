%% Function - myHE
% My LinearContrastStretching performs histogram
% equalization on the entire matrix. Calls equalizeChannel
% as a subroutine

function [output] = myHE(input)
    
    output = zeros(size(input,1),size(input,2),size(input,3));
    for i=1:size(input,3)
        output(:,:,i) = equalizeChannel(input(:,:,i));
    end
    
    output = uint8(output);

end
