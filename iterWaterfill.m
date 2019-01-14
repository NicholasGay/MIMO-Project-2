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

H1 = H(:,:,1);
H2 = H(:,:,2);

Q1_old = zeros(N,N);
Q2_old = zeros(N,N);

Q2 = zeros(N,N);
iinteration = 0;
%% interation Starts
while(true)
    iinteration = iinteration +1;
    %% user 1
   
    inv_arg = H2*Q2_old*H2'+eye(M);
    X = H1'/inv_arg*H1;
    [Q1,R1] = ratemaxQk(X,P(1));
        
    %% User 2
   
    inv_arg = H1*Q1_old*H1'+eye(M);
    X = H2'/inv_arg*H2;
    [Q2,R2] = ratemaxQk(X,P(2));   
    
    Rsum(iinteration) = R1+R2;
    %% Check for convergence
    if sum([norm(Q1-Q1_old,'fro')^2,norm(Q2-Q2_old,'fro')^2])<epsilon
        break;
    else   
    Q1_old =Q1; 
    Q2_old = Q2;
    end
    
    
    
end

Csum = log2(det(eye(M) + H1*Q1*H1'+H2*Q2*H2'));

Q(:,:,1) = Q1;
Q(:,:,2) = Q2;



