function [Q,Csum,Rsum] = iterWaterfill(H,P,epsilon)
% Function [Q,Csum,Rsum] = iterWaterfill(H,P,epsilon)
% 
% The function calculates the sum capacity and the corresponding
% transmit covariance matrices of the K user MIMO MAC via
% the iterative waterfilling principle.
%
% Inputs
% H: M x N x 2 array of users' channel matrices
% E: 2 x 1 vector of users' available transmit powers
% epsilon: accuracy of the algorithm (sopping criteria)
% Outputs
% Q: N x N x 2 array of users' optimal transmit covariance matrices
% Csum: sum capacity of the MIMO MAC
% Rsum: vector of sum rate values for the iterations
%

if nargin<3, epsilon = 1e-4; end
maxiter = 1e4;
M = size(H,1);
N = size(H,2);



