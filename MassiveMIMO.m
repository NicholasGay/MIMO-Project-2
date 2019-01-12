% Modify the script MassiveMIMO.m to plot the ergodic sum rate for joint 
% decoding and the large system approximation from Question 20 versus the 
% number of transmit antennas for the K=5 user MAC with M = 10,...,200, at 
% a transmit power of PTx = 10 dB. To this end, determine the average 
% achievable rates for L = 1000 randomly generated Gaussian channels with 
% [h_k]_j ? N(0,1/M).

% Number of Monte Carlo runs
L = 1000;

% Number of users
K=5;

% Vector containing the number of antennas the simulations are run for
M_vec = (10:10:200)';

% Transmit power in dB
Ptx_db = 10;

% ToDo: Convert transmit power to linear domain
Ptx = 

% ToDo: Determine the large system approximation
Rapprox = 

Rsumjoint = zeros(L,length(M_vec));

for l=1:L
    % Print progress of the simulation
    if(~mod(l,10)), fprintf('%3d.',l), end
    if(~mod(l,100)), fprintf('\n',l), end
    
    for jj = 1:length(M_vec)
        
        M = M_vec(jj);
        
        % ToDo: Generate channel in the form H = [h_1,h_2,...,h_K]

        
        % ToDo: Calculate Rsumjoint(l,jj)

    end
end

fprintf('\n')

% ToDo: Plot the ergodic sum rate for joint decoding and the large system 
% approximation versus the number of transmit antennas

