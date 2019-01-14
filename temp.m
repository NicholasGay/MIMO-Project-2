P = [0;0];
load('exampleMAC')
H1 = H(:,:,1);
H2 = H(:,:,2);
Ptx = 10.^(P/10);
%% Question 8 (index 1(Q2 = 0) and 2(Q1=0) 4th dim)
% User 1
X1 = H1'*H1;
[Q(:,:,1,1),C1] = ratemaxQk(X1,Ptx);
Q(:,:,2,1) = zeros(size(Q(:,:,1,1)));
% User 2
X2 = H2'*H2;
[Q(:,:,2,2),C2] = ratemaxQk(X2,Ptx);
Q(:,:,2,2) = zeros(size(Q(:,:,1,1)));
%% Question 10 (index 3)
% User 1, Single
inv_arg = H2*Q(:,:,2,2)*H2';
inv_arg = eye(size(inv_arg)) + inv_arg;
X1_single = H1'/inv_arg*H1;
[Q(:,:,1,3),C1_single] = ratemaxQk(X1_single,Ptx);
% User 2, Single
inv_arg = H1*Q(:,:,1,1)*H1';
inv_arg = eye(size(inv_arg)) + inv_arg;
X2_single = H2'/inv_arg*H2;
[Q(:,:,2,3),C2_single] = ratemaxQk(X2_single,Ptx);

%% Question 12 (index 4)
epsilon = 10^(-4);
[Q(:,:,:,3),Csum,Rsum] = iterWaterfill(H,P,epsilon);

%% Plotting
%% need change for single user

fig = figure;
hold on

for i = 1:1:size(Q,4)
[R(:,:,i),Rsum(i)] = ratesMAC(Q(:,:,:,i),H);
fig = plotRegionMAC(R(:,:,i),fig);
end

legend('8','10','12')
xlabel('R_1')
ylabel('R_2')