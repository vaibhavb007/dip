function [x] = adaptiveHistogram(A)
    
    intensity = A((size(A,1)+1)/2,(size(A,2)+1)/2);
    Pixel_positions = find(A<=intensity);
    fraction = size(Pixel_positions,1)/(size(A,1)*size(A,2));
    x = fraction*255;

end