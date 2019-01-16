clear all 
clc
close all
Ptx_dB = [0;0];
load('exampleMAC')
H1 = H(:,:,1);
H2 = H(:,:,2);
Ptx = 10.^(Ptx_dB/10);
%% Question 8
% User 1
X1 = H1'*H1;
[Q(:,:,1,1),C1] = ratemaxQk(X1,Ptx);
% User 2
X2 = H2'*H2;
[Q(:,:,2,1),C2] = ratemaxQk(X2,Ptx);

%% Question 10
% User 1, Single
inv_arg = H2*Q(:,:,2,1)*H2';
inv_arg = eye(size(inv_arg)) + inv_arg;
X1_single = H1'/inv_arg*H1;
[Q(:,:,1,2),C1_single] = ratemaxQk(X1_single,Ptx);
% User 2, Single
inv_arg = H1*Q(:,:,1,1)*H1';
inv_arg = eye(size(inv_arg)) + inv_arg;
X2_single = H2'/inv_arg*H2;
[Q(:,:,2,2),C2_single] = ratemaxQk(X2_single,Ptx);
%% Question 12
epsilon = 10^(-4);
[Q(:,:,:,3),Csum,Rsum] = iterWaterfill(H,Ptx,epsilon);

%% Plotting
%% need change for single user

fig = figure;
hold on

for i = 1:1:3
[R(:,:,i),Rsum(i)] = ratesMAC(Q(:,:,:,i),H);
r_D = [0; R(2,1,i)];
r_C = [R(1,2,i); 0];
fig = plotRegionMAC([r_D,R(:,:,i),r_C],fig);
end

legend('8 dB','10 dB','12 dB')
xlabel('R_1')
ylabel('R_2')