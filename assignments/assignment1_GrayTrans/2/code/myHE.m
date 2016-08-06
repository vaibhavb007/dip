function [output] = myHE(input)
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here

    output = zeros(size(input,1),size(input,2),size(input,3));

    for i=1:size(input,3)
        output(:,:,i) = equalizeChannel(input(:,:,i));
%         figure, histogram(input(:,:,i))
%         figure, histogram(output(:,:,i))
    end
    
    if size(input,3) == 3
        output = uint8(output);
    end
    
    %imwrite(output,'out.jpg');
    %disp(input)
    %disp(output)
    
end

function [B] = equalizeChannel(A)
    cdf = 0;
    B = zeros(size(A,1),size(A,2));
    for intensity = 0:255
        Pixel_positions = find(A==intensity);
        fraction = size(Pixel_positions,1)/(size(A,1)*size(A,2));
        cdf = cdf + fraction;
        final_intensity = cdf*255;
        B(Pixel_positions) = final_intensity;
    end
end
