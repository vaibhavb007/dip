function [output] = myAHE(input , windowSize)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    columnCount = size(input,2);
    rowCount = size(input,1);
    output = zeros(rowCount,columnCount,size(input,3));

    for i = 1:size(output,3)
        output(:,:,i) = nlfilter(input(:,:,i),'indexed',[windowSize windowSize],@equalizeChannel);
    end

end


function [x] = equalizeChannel(A)
    cdf = 0;
    B = zeros(size(A,1),size(A,2));
    for intensity = 0:255
        Pixel_positions = find(A==intensity);
        fraction = size(Pixel_positions,1)/(size(A,1)*size(A,2));
        cdf = cdf + fraction;
        final_intensity = cdf*255;
        B(Pixel_positions) = final_intensity;
    end
    
    x = B((size(B,1)+1)/2,(size(B,2)+1)/2);
end
