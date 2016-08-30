%% Part 3 - Patch Based Filter
% Showing effects of patch based filter
tic;
% Call function myPatchBasedFiltering.m which takes inputs - imageMatrix,
A = load('../data/barbara.mat','-mat');
A = A.imageOrig;
[A,B,C] = myPatchBasedFiltering(A);

figure('OuterPosition',[0 0 1300 600]);
subplot(1,3,1); Display(A);
subplot(1,3,2); Display(B);
subplot(1,3,3); Display(C);
toc;
