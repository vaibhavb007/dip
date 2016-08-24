function  fmin  =  minLp (f, w, p)
% f is a matrix of size N x n, where N is the size
% of the patch, and n is the number of neighbors
%
% w is the weight vector of size n X 1
%
% fmin = arg min_f \sum_j w(j) (|| f(:, j) - g(:)||_2 )^p
%
% fmin is found using the IRLS algorithm

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author:    Kunal N. Chaudhury
% Date:      Dec 1, 2012
%
% Reference:
% K. N. Chaudhury, A. Singer, "Non-Local Patch Regression:
% Robust image denoising in patch space", IEEE International
% Conference on Acoustics, Speech, and Signal Processing, 2013.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% initialization
fmin  = (f * w) / sum(w);
n     = length(w);
del   = 1 - p/2;
eps   = 1e-6;
err   = 1;
iter  = 0;
Niter = 30;

while (err > 1e-6) && (iter < Niter)
    iter = iter + 1;
    residuals = sum( (fmin * ones(1,n) - f).^2, 1);
    gamma     = 1./ (residuals + eps * ones(1,n)).^del;
    ww        = gamma' .* w;
    f_hold    = (f * ww) / sum(ww);
    err       = norm(f_hold - fmin);
    %disp(err);
    fmin     = f_hold;
end

%fprintf('Number of iterations = %d \n', iter);




