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
