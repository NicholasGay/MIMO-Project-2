function [ R ] = FDMArates(H,P,alpha)
% function [ R ] = FDMArates(H,P,alpha)
%
% Computes the rate coordinates for orthogonal multiple access vector MAC
% for a specific choice of alpha
%
% Input:
% H: Mx2 array of channel vectors H = [h_1, h_2]
% P: 1x2 array of maximum available transmit powers P = [Ptx1, Ptx2]
% alpha: Value for allocation fraction of user 1
%
% Ouput:
% R: 2x1 array of rate tuple R = [R1, R2]^T

R(1,1) = alpha*log2(1+(norm(h_1))^2*(P(1,1)/alpha));
R(2,2) = alpha*log2(1+(norm(h_2))^2*(P(1,2)/alpha));

end

