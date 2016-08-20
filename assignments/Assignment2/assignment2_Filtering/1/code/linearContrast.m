%% Function - linearContrast
% Function to linearly contrast the image such that
% minimum intensity is 0 and maximum intensity is 255

function [ B ] = linearContrast( A )
    mmax = max(max(A));
    mmin = min(min(A));
    B = round((A-mmin)* (255/(mmax-mmin)));
    
end

