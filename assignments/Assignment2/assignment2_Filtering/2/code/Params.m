%% Parameters for Bilateral Filter
% Parameters used for the bilateral filter part

%% Section 1 Optimal Parameters
% Parameters leading to lowest RMSD
windowSize = 21
sigma_d = 1.45
sigma_r = 10
optimalRmsd = 74.3217
%% Section 2 RMSD values for non optimal parameters
% Experimentally verifying that in neighbourhood, RMSD is greater
% Rmsd(i,j) = Rmsd where sigma_d = i * optimalSigma_d and sigma_r = j *
% optimalSigma_r
Rmsd(0.9,1) = 74.4084
Rmsd(1.1,1) = 74.3893
Rmsd(1,0.9) = 74.7897
Rmsd(1,1.1) = 74.7148




