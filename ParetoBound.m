function [R] = ParetoBound(H,P,S)
% Function [R] = ParetoBound(H,P,S)
%
% The function calculates S coordinate points at the
% Pareto Boundary of the two-user MIMO MAC capacity region
% via varying the weights w_1 and w_2.
%
% Inputs
% H: M x N x 2 array of given channels to the users
% P: 2 x 1 column vector of available transmit power
% S: number of Pareto Boundary sample points S
% Outputs
% R: 2 x S matrix of rate region coordinates

M = size(H,1);
N = size(H,2);

s = 0:1/(2*S):1;

for i = 1:1:length(s)
    w(1) = s(i);
    w(2) = 1-s(i);
    
    flag = w(2)-w(1);
    switch flag
        
        case 0 %% Interative
            epsilon = 10^(-4);
            [Q,~,~] = iterWaterfill(H,P,epsilon);
            [R_temp,~] = ratesMAC(Q,H);
            R(:,i) = R_temp(:,1);
            R(:,i+1) = R_temp(:,2);
            
            
        case 1 %% Single User Bounds
            if w(1) == 0
                %% user 2 max
                R(1,i) = 0;
                Xk = H(:,:,2)'*H(:,:,2);
                [~,R(2,i)] = ratemaxQk(Xk,P(2));
            else
                %% user 1 max
                R(2,1) = 0;
                Xk = H(:,:,1)'*H(:,:,1);
                [~,R(1,i)] = ratemaxQk(Xk,P(1));
            end
        otherwise
            %% WSR
            [Q,Cwsr ] = maxWSRmac(H,P,w);
            [R_temp,~] = ratesMAC(Q,H);
            if w(1) > w(2)
               l = i+1;
               R(:,l) = R_temp(:,2);
               
            else
               R(:,i) = R_temp(:,1);
            end
    end
    
end