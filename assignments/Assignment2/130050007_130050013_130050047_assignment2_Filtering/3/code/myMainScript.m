%% Part 3 - Patch Based Filter
% Showing effects of patch based filter
tic;
A = load('../data/barbara.mat','-mat');
A = A.imageOrig;
optimal_sigma = 4;

% Call function myPatchBasedFiltering.m which takes inputs - imageMatrix
% and the standard deviation(sigma)
[A,B,C] = myPatchBasedFiltering(A, optimal_sigma);

% Optimal sigma is 4.
% For optimal sigma, we get the RMSD value as 2.6659
% For sigma = 4.4, we get the RMSD value as 2.7154
% For sigma = 3.6, we get the RMSD value as 2.7134

minC = min(B(:));
maxC = max(B(:));

figure('OuterPosition',[0 0 1300 600]);
x1 = subplot(1,3,1);
imshow(A,[])
colormap(x1,gray)
caxis([minC maxC])
colorbar
axis on;

x2 = subplot(1,3,2); 
imshow(B,[])
colormap(x2,gray)  
colorbar
axis on;

x3 = subplot(1,3,3);
imshow(C,[])
colormap(x3,gray)
caxis([minC maxC])
colorbar
axis on;

toc;