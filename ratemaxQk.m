function [Qk,Ck] = ratemaxQk(Xk,Pk)
% Function [Qk,Ck] = ratemaxQk(Xk,Pk)
%
% The function calculates the maximum rate and
% the rate maximizing transmit covariance.
%
% Inputs
% Xk: N x N matrix of effective noise covariance
% Pk: Maximum available transmit power
% Outputs
% Qk: single user rate maximizing transmit covariance matrix
% Ck: maximum single user rate

% TODO

%% EVD of Xk
[V,phi] = eig(Xk);
phi = real(diag(phi));
%% Psi
[psi,mu,K] = waterfilling(phi,Pk);

%% Qk
Qk = V*diag(psi)*V';

%% Ck
Ck_temp = Xk*Qk;
Ck_temp = eye(size(Ck_temp)) + Ck_temp;
Ck = log2(det(Ck_temp));
