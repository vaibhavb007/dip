%% Parameters for Bilateral Filter
% Parameters used for the bilateral filter part

%% Section 1 Optimal Parameters
% Parameters leading to lowest RMSD
windowSize = 21
sigma_d = 1.45
sigma_r = 10
optimalRmsd = 3.2874
%% Section 2 RMSD values for non optimal parameters
% Experimentally verifying that in neighbourhood, RMSD is greater
% Rmsd(i,j) = Rmsd where sigma_d = i * optimalSigma_d and sigma_r = j *
% optimalSigma_r
Rmsd(0.9,1) = 3.3044
Rmsd(1.1,1) = 3.2905
Rmsd(1,0.9) = 3.3086
Rmsd(1,1.1) = 3.3040




