% VectorMACCapacityVsFDMA.m
%
% Plot the capacity region and the achievable rate region with orthogonal
% multiple access of the Gaussian vector MAC. Consider the three exemplary
% channels given in the file exampleVecMAC.mat.
% Create a plot for each antenna configuration and for the tranmit powers
% Ptx1 = Ptx2 = 0dB, 10dB, and 20 dB. To this end, use the result from Task
% 2.5 for the capacity region and evaluate the function FDMarate for S
% linearly spaced choices of alpha in [0,1] for the achievable rate region.
% The result can be plotted with help of the function plotRegionMAC.m


S = 100;
PtxdB = [0, 10, 20];
Ptx = 10.^(PtxdB/10);

% Load exemplary Channels
load('exampleVecMAC')

% Loop for channel realizations
for ll=1:2
    
    % Load respective channel into variable H
    H = evalin('base',['H',num2str(ll)]);
    M = size(H,1);
    
    % Loop for Transmit powers
    for k=1:length(Ptx)
        
        P = Ptx(k) * ones(1,2);
        
        % ToDo:
        % Calculate C1, C2, and Csum
        C1 = log2(1+((norm(H(:,1))^2)*P(1,1)));
        C2 = log2(1+((norm(H(:,2))^2)*P(1,2))); 
        Csum = log2(1+((norm(H(:,2))^2)*P(1,2))+((norm(H(:,1))^2)*P(1,1))); 
        
        % ToDo:
        % Determine capacity region in the form C = [r_D, r_A, r_B, r_C]
        C = [C2, Csum-C2, Csum-C1, C1];
                
        R = zeros(2,S);
        % Initialize vector for allocation fractions
        alphavec = linspace(0,1,S);
        
        % ToDo:
        % Determine boundary points for alpha = 0 and alpha = 1 separately
        % to avoid numerical issues and determine remaining boundary points
        R(1,1)   = 0;
        R(2,1)   = C2;
        R(1,end) = C1;
        R(2,end) = 0;
        
        for ii=2:length(alphavec)-1
            R(:,ii) = [(alphavec(ii)*C1)+((1-alphavec(ii))*(Csum-C2)); (alphavec(ii)*(Csum-C1))+((1-alphavec(ii))*(C2))];
        end
        
        % Assign subplot object to 'fig'
        fig = subplot(3,length(Ptx),(ll-1)*3+k);
        
        % ToDo:
        % Plot the rate region and capacity region into Figure 'fig'

        
        % Task 4
        % ToDo:
        % Determine optimal alpha to maximize the sum rate with orthogonal
        % multiple access and the corresponding coordinate
        fig = plotRegionMAC(R,fig);
        
        
        % Modify appearance of axis   
        axismax = max(C1,C2);
        axis([0, 1.1*axismax,0, 1.1*axismax]);
        title(['Channel',num2str(ll),', P = ',num2str(P(1)), ', M = ',num2str(M)])
        xlabel('R_1')
        ylabel('R_2')
        
    end
end