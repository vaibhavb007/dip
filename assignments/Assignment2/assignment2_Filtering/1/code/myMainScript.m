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
Display('lionCrop_orig',A2);

B = myUnsharpMasking(A, 2, 1);
B = linearContrast(B);
Display('lionCrop_sharpen',B);

%Apply it on superMoonCrop.mat
A = load('../data/superMoonCrop.mat','-mat');
A = A.imageOrig;
A = A*255;
A2 = linearContrast(A);
Display('superMoonCrop_orig',A2);

B = myUnsharpMasking(A, 2.4, 1.2);
B = linearContrast(B);
Display('superMoonCrop_sharpen',B);

toc;
