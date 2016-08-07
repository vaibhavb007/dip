function [x] = equalizeChannelCutoff(A)
    fracCutoff =0.5;
    cdf = 0;
    B = zeros(size(A,1),size(A,2));
    sum=0;
    if fracCutoff == 1
        for intensity = 0:255
            Pixel_positions = find(A==intensity);
            fraction = size(Pixel_positions,1)/(size(A,1)*size(A,2));
            if fraction > fracCutoff
                sum =sum + (fraction-fracCutoff);
            end
        end
    end
    
    fracToAdd = sum/256;
    
    for intensity = 0:255
        Pixel_positions = find(A==intensity);
        fraction = size(Pixel_positions,1)/(size(A,1)*size(A,2));
        if fraction > fracCutoff
            fraction = fracCutoff;
        end
        cdf = cdf + fraction + fracToAdd;
        final_intensity = cdf*255;
        B(Pixel_positions) = final_intensity;
    end
    x = B((size(B,1)+1)/2,(size(B,2)+1)/2);
end
