function [] = bilateralFilter(A)
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

w=10;
sigma_d = 1.7;
sigma_r = 1.1*8;
[X,Y] = meshgrid(-w:w,-w:w);
G_space = exp(-(X.^2+Y.^2)/(2*sigma_d^2));

dim = size(corruptedImage);

for i = 1:dim(1)
   for j = 1:dim(2)
      
         % Extract local region.
         iMin = max(i-w,1);
         iMax = min(i+w,dim(1));
         jMin = max(j-w,1);
         jMax = min(j+w,dim(2));
         window = corruptedImage(iMin:iMax,jMin:jMax);
      
         % Compute Gaussian intensity weights.
         G_Intensity = exp(-(window-corruptedImage(i,j)).^2/(2*sigma_r^2));
      
         % Calculate bilateral filter response.
         F = G_Intensity.*G_space((iMin:iMax)-i+w+1,(jMin:jMax)-j+w+1);
         B(i,j) = sum(F(:).*window(:))/sum(F(:));         
   end
end
Display('3',B);
rmsd = sqrt(sum((B(:) - A(:)).^2)/dimen(1));
disp(rmsd);
end