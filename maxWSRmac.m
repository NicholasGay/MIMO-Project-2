function [ Q,Cwsr ] = maxWSRmac(H,P,w)
% function [Q,Cwsr] = maxWSRmac(H,P,w)
%
% The function calculates the WSR capacity Cwsr and
% the optimal transmit covariance matrices Q of the
% two-user MAC with the convex optimization tool YALMIP
%
% Inputs
% H: M x N x 2 array of given channels to the users
% P: 2 x 1 column vector of available transmit power
% w: 2 x 1 column vector of weights w_1,...,w_K
% Outputs
% Cwsr: maximum WSR after convergence (WSR capacity)
% Q: N x N x 2 array of optimal covariance matrices
%
% Hint: Distinguish the cases w(2)>w(1) and w(1)>=w(2)

H1 = H(:,:,1);
H2 = H(:,:,2);
[M,N] = size(H1);



end

