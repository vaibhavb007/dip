function [] = myPatchBasedFiltering(A)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
A = load('../data/barbara.mat','-mat');
A = A.imageOrig;
dimen = size(A);
minI = min(min(A));
maxI = max(max(A));
sd = double(minI+0.20*(maxI-minI));
gaussianMask = sqrt(sd)*randn(dimen(1));
Display('Gaussian Mask',gaussianMask);
corruptedImage = A +gaussianMask;
Display('2',corruptedImage);


N = 10;
P = 4;

d = 1;

[m,n] = size(corruptedImage);
B = zeroes(m,n);
for i = 1:m
   for j = 1:n
      
         % Extract local window
         wxMin = max(i-w,1);
         wxMax = min(i+w,m);
         wyMin = max(j-w,1);
         wyMax = min(j+w,n);
         
         currentPatch = corruptedImage(i-p:i+p, j-p:j+p);
         
         numerator = 0;
         denominator = 0;
         
         for a = wxMin:wxMax
             for b = wyMin:wyMax
                iterativePatch = corruptedImage(a-p:a+p, b-p:b+p);
                gaussian = exp(-(currentPatch - iterativePatch).^2/(2*d^2));
                denominator = gaussian + denominator;
                numerator = gaussian*corruptedImage(a,b) + numerator;
             end
         end
         B(i,j) = numerator/denominator;
   end
end
Display('3',B);
rmsd = sqrt(sum((B(:) - A(:)).^2)/dimen(1));
disp(rmsd);
end