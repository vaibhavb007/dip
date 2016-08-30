%% Function - myBilateralFiltering
% Function takes inputs as imageMatrix, sigma for spatial gaussian 
% and sigma for gaussian over intensity. Then it applies bilateral
% filter on image using these parameters.

function [corruptedImage, N] = myBilateralFiltering(A, sigma_d, sigma_r)

dimen = size(A);
minI = min(min(A));
maxI = max(max(A));

sd = double(0.05*(maxI - minI));

rng(0); % set seed so that the corrupted image is constant
noiseMask = sd * randn(dimen(1));
corruptedImage = A + noiseMask;

w=ceil(1.5*sigma_d);

%create spatial gaussian mask
[X,Y] = meshgrid(-w:w,-w:w);
G_space = exp(-(X.^2+Y.^2)/(2*sigma_d^2))/(sigma_d*sqrt(2*pi));
imagesc(G_space)
colormap(gray)
colorbar
axis on;

for i = 1:dimen(1)
   for j = 1:dimen(2)
      
         % Extract local region.
         iMin = max(i-w,1);
         iMax = min(i+w,dimen(1));
         jMin = max(j-w,1);
         jMax = min(j+w,dimen(2));
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