%% Part 1 : Image Sharpening
%%
%%% Image sharpening using Unsharp mask filter
% Call function myUnsharpMasking
% Function takes inputImageMatrix, sigma and scale as argument

tic;

% Apply it on lionCrop.mat
A = load('../data/lionCrop.mat','-mat');
A = A.imageOrig;
A = A*255;
A2 = linearContrast(A);

B = myUnsharpMasking(A, 2, 1);
B = linearContrast(B);

figure('OuterPosition',[0 0 1200 600]);
subplot(1,2,1); Display(A2);
subplot(1,2,2); Display(B);

%Apply it on superMoonCrop.mat
A = load('../data/superMoonCrop.mat','-mat');
A = A.imageOrig;
A = A*255;
A2 = linearContrast(A);

B = myUnsharpMasking(A, 2.4, 1.2);
B = linearContrast(B);

figure('OuterPosition',[0 0 1200 600]);
subplot(1,2,1); Display(A2);
subplot(1,2,2); Display(B);

toc;
