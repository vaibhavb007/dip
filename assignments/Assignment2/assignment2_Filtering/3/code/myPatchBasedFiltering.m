%% Function - myPatchBasedFiltering
% Function takes inputs as imageMatrix. It takes as input the image and the standard
% deviation for the kernel regression function. Then it applies patch-based
% filter on the image using this parameter
function [L,M,N] = myPatchBasedFiltering(A, sigma)
%Blur the image and then subsample it to reduce the time taken.
A = imgaussfilt(A, 0.66);
A = A(1:2:end,1:2:end);

%Corrupt the image
L = A;
[m,n] = size(A);
minI = min(min(A));
maxI = max(max(A));
sd = 0.05*(maxI-minI); % set the standard deviation for the noise
rng(0); % set seed so that the corrupted image is constant
noise = sd*randn(m);
corruptedImage = A +noise;
M = corruptedImage;

w = 12;
p = 4;


B = zeros(m,n);
paddedImg = padarray(corruptedImage, [p p]);
%Gaussian mask to have the 
gaussian_mask = fspecial('gaussian', [9,9], 1.25);
imagesc(gaussian_mask)
colormap(gray)
colorbar
axis on;

for i = 1:m
   for j = 1:n
      
         % Extract local window
         wxMin = max(i-w,1);
         wxMax = min(i+w,m);
         wyMin = max(j-w,1);
         wyMax = min(j+w,n);
         
         %Current patch for the pixel [i,j]
         currentPatch = paddedImg(i:i+2*p, j:j+2*p);
         
         numerator = 0;
         denominator = 0;
         
         for a = wxMin:wxMax
             for b = wyMin:wyMax
                iterativePatch = paddedImg(a:a+2*p, b:b+2*p);
                gaussian = exp(-sum(sum(((currentPatch - iterativePatch).^2).*gaussian_mask))/(2*sigma^2));
                denominator = gaussian + denominator;
                numerator = gaussian*corruptedImage(a,b) + numerator;
             end
         end
         %Update the [i,j] pixel of the output image
         B(i,j) = numerator/denominator;
   end
end
N = B;
%Compute the Root Mean Squared Difference value.
rmsd = sqrt(sum((B(:) - A(:)).^2)/(m*n));
disp(rmsd);
end