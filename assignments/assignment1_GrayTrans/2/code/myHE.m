function [output] = myHE(input)
    
    output = zeros(size(input,1),size(input,2),size(input,3));
    for i=1:size(input,3)
        output(:,:,i) = equalizeChannel(input(:,:,i));
    end
    
    if size(input,3) == 3
        output = uint8(output);
    end
    
    %imwrite(output,'out.jpg');
    %disp(input)
    %disp(output)
    
end
