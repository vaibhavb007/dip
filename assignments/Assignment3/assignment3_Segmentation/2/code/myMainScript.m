%% MyMainScript

tic;
%% Your code here
A = imread('../data/baboonColor.png', 'png');
B = imgaussfilt(A,1); % gaussian filtering
C=B(1:2:end,1:2:end,:); %subsampling
C = double(C);
[IDX,D] = knnsearch(C(:),p,'K',300,'Distance',);
toc;


Function = distfun(ZI,ZJ)