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


w = 10;
p = 4;
d = 25;

[m,n] = size(corruptedImage);
B = zeros(m,n);
paddedImg = padarray(A, [p p]);
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
                gaussian = exp(-sum(sum((currentPatch - iterativePatch).^2))/(2*d^2));
                denominator = gaussian + denominator;
                numerator = gaussian*corruptedImage(a,b) + numerator;
             end
         end
         %disp(numerator);
         %disp(denominator);
         B(i,j) = numerator/denominator;
   end
end
Display('3',B);
rmsd = sqrt(sum((B(:) - A(:)).^2)/dimen(1));
disp(rmsd);
end