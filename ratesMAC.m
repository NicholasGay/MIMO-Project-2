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
Rsum_temp = eye(M) + H(:,:,1)*Q(:,:,1)*H(:,:,1)'+ H(:,:,2)*Q(:,:,2)*H(:,:,2)';
Rsum = real(log2(det(Rsum_temp)));

R1_temp = eye(M) + H(:,:,1)*Q(:,:,1)*H(:,:,1)';
R1 = log2(det(R1_temp));

R2_temp = eye(M) + H(:,:,2)*Q(:,:,2)*H(:,:,2)';
R2 = log2(det(R2_temp));

r_A = [Rsum-R2;R2];
r_B = [R1;Rsum-R1];
R = real([r_A,r_B]);