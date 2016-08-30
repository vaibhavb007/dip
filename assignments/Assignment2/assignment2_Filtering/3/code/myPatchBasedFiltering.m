function [L,M,N] = myPatchBasedFiltering(A)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
A = imgaussfilt(A, 0.66);
A = A(1:2:end,1:2:end);
L = A;
dimen = size(A);
minI = min(min(A));
maxI = max(max(A));
sd = 0.05*(maxI-minI);
rng(0); % set seed so that the corrupted image is constant
gaussianMask = sd*randn(dimen(1));
corruptedImage = A +gaussianMask;
M = corruptedImage;

w = 12;
p = 4;
d = 3.6;

[m,n] = size(corruptedImage);
B = zeros(m,n);
paddedImg = padarray(corruptedImage, [p p]);

gaussian_mask = fspecial('gaussian', [9,9], 1.25);

for i = 1:m
   for j = 1:n
      
         % Extract local window
         wxMin = max(i-w,1);
         wxMax = min(i+w,m);
         wyMin = max(j-w,1);
         wyMax = min(j+w,n);
         
         currentPatch = paddedImg(i:i+2*p, j:j+2*p);
         
         numerator = 0;
         denominator = 0;
         
         for a = wxMin:wxMax
             for b = wyMin:wyMax
                iterativePatch = paddedImg(a:a+2*p, b:b+2*p);
                gaussian = exp(-sum(sum(((currentPatch - iterativePatch).^2).*gaussian_mask))/(2*d^2));
                denominator = gaussian + denominator;
                numerator = gaussian*corruptedImage(a,b) + numerator;
             end
         end
         B(i,j) = numerator/denominator;
   end
end
N = B;
rmsd = sqrt(sum((B(:) - A(:)).^2)/(dimen(1)*dimen(2)));
disp(rmsd);
end