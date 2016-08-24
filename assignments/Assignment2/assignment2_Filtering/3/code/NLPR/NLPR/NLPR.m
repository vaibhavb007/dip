function imgOut = NLPR(imgIn, h, P, S, c)
% function for Non-local Patch Regression with 0 < p <= 1
%
%  Author: K.N. Chaudhury
%  Date  : Dec 1, 2012
%
%  Reference:
%  K. N. Chaudhury, A. Singer, "Non-Local Patch Regression:
%  Robust image denoising in patch space", IEEE International
%  Conference on Acoustics, Speech, and Signal Processing, 2013.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N   = 2*P + 1;
h2  = h * h;
kNN = ceil ( (2*S + 1)^2 / 2 );

[m,n]  = size(imgIn);
imgPad = padarray(imgIn, [P P], 'symmetric');
imgOut = zeros(m, n);


% Go concurrent matlabpool
% if matlabpool('size') == 0
%     matlabpool open;
% end

fprintf('Looping over pixels....\n');
% loop over pixels
for i = 1 : m
    ii = i + P;
    for j = 1 : n
        jj = j + P;
        
        patchRef = imgPad(ii - P : ii + P, jj - P : jj + P);
        
        pmin = max(i - S, 1) + P;
        qmin = max(j - S, 1) + P;
        pmax = min(i + S, m) + P;
        qmax = min(j + S, n) + P;
        
        s1 = pmax - pmin + 1;
        s2 = qmax - qmin + 1;
        
        w               =  zeros(s1, s2);
        neighborPatches =  zeros(s1, s2, N^2);
        patchCurrent    =  zeros(2*P + 1, 2*P + 1); %#ok<*NASGU>
        patch           =  zeros(N, N);
        
        u = 0;
        for p = pmin : pmax
            u = u + 1;
            v = 0;
            for q = qmin : qmax
                v = v + 1;
                patchCurrent = imgPad(p - P : p + P, q - P : q + P);
                d2 = sum(sum( (patchRef - patchCurrent) ...
                    .* (patchRef - patchCurrent) ));
                w(u, v)  =  exp(- d2 / h2);
                patch  =  imgPad(p - P : p + P, q - P : q + P);
                neighborPatches(u, v, :) = reshape(patch, [N^2  1]);
            end
        end
        
        % sort weights
        w     = reshape(w, [s1*s2  1]);
        [w,I] = sort(w, 'descend');
        L     = min(kNN, s1*s2);
        
        f          =  reshape(neighborPatches, [s1*s2   N^2])';
        f_est      =  minLp(f(: , I(1 : L)), w(1 : L), c);
        patch_est  =  reshape(f_est, [N  N]);
        imgOut(i, j) =  patch_est(P + 1, P + 1);
    end
end



