function [Q,Cwsr ] = maxWSRmac(H,P,w)
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

 % Set YALMIP options
options = sdpsettings('solver','sdpt3','verbose',0);

% Initialize optimization variables
Q1 = sdpvar(N,N,'hermitian','complex');
Q2 = sdpvar(N,N,'hermitian','complex');

% Define Constraint set
Constraints = [Q1>=0, Q2>=0, trace(Q1) <= P(1), trace(Q2) <= P(2)];

Objective_arg2 = eye(M) + H1*Q1*H1' + H2*Q2*H2';
if w(1)>=w(2)
    Objective_arg1 = eye(M) + H1*Q1*H1'; 
    Objective = -((w(1)-w(2))*logdet(Objective_arg1) + w(2)*logdet(Objective_arg2));
else
   Objective_arg1 = eye(M) + H2*Q2*H2'; 
   Objective = -((w(2)-w(1))*logdet(Objective_arg1) + w(1)*logdet(Objective_arg2));
end

%Solve Optimization Problem
sol = optimize(Constraints,Objective,options);

%Retrive Solution
Q(:,:,1) = value(Q1);
Q(:,:,2) = value(Q2);

Objective_arg2 = eye(M) + H1*Q(:,:,1)*H1' + H2*Q(:,:,2)*H2';
if w(1)>=w(2)
   Objective_arg1 = eye(M) + H1*Q(:,:,1)*H1'; 
   Cwsr = (w(1)-w(2))*log2(det(Objective_arg1)) + w(2)*log2(det(Objective_arg2));
else
   Objective_arg1 = eye(M) + H2*Q(:,:,2)*H2'; 
   Cwsr = (w(2)-w(1))*log2(det(Objective_arg1)) + w(1)*log2(det(Objective_arg2));
end



