%% Function - myBilateralFiltering
% Function takes inputs as imageMatrix, sigma for spatial gaussian 
% and sigma for gaussian over intensity. Then it applies bilateral
% filter on image using these parameters.

function [M, N] = myBilateralFiltering(A, sigma_d, sigma_r)

dimen = size(A);
minI = min(min(A));
maxI = max(max(A));

sd = double(0.05*(maxI - minI));

rng(0); % set seed so that the corrupted image is constant
gaussianMask = sd * randn(dimen(1));

figure('OuterPosition',[0 0 500 500]);
imshow(gaussianMask, []);
colorbar;
axis on;

corruptedImage = A + gaussianMask;
M = corruptedImage;

w=10;
[X,Y] = meshgrid(-w:w,-w:w);
G_space = exp(-(X.^2+Y.^2)/(2*sigma_d^2))/(sigma_d*sqrt(2*pi));

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
         G_Intensity = exp(-(window-corruptedImage(i,j)).^2/(2*sigma_r^2))/(sigma_r*sqrt(2*pi));
      
         % Calculate bilateral filter response.
         F = G_Intensity.*G_space((iMin:iMax)-i+w+1,(jMin:jMax)-j+w+1);
         B(i,j) = sum(F(:).*window(:))/sum(F(:));         
   end
end

N = B;
rmsd = sqrt(sum((B(:) - A(:)).^2)/(dimen(1)*dimen(2)));
disp(rmsd);

end