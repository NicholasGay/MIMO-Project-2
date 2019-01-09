function [R,Rsum] = ratesMAC(Q,H)
% Function function [R,Rsum] = ratesMAC(Q,H)
%
% The function ratesMAC computes the rate region coordinates of
% the MIMO MAC for given transmit covariance matrices.
%
% Inputs
% H: M x N x 2 array of the given channel realizations, where
%    N is the number transmit antennas
%    M is the number receive antennas
% Q: M x N x 2 array of the given tranmit covariance matrices realizations
% Outputs
% R: 2 x 2 matrix of rate region coordinates R = [r_A, r_B]
% Rsum: achievable sum-rate

M = size(H,1);

% TODO