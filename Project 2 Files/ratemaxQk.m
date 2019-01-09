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