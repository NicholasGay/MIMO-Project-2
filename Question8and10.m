load('exampleMAC')
PtxdB = 0;
Ptx = 10.^(PtxdB/10);

H1 = H(:,:,1);
H2 = H(:,:,2);

%% Question 8
% User 1
X1 = H1'*H1;
[Q1,C1] = ratemaxQk(X1,Ptx);

% User 2
X2 = H2'*H2;
[Q2,C2] = ratemaxQk(X2,Ptx);

%% Question 10
% User 1, Single
inv_arg = H2*Q2*H2';
inv_arg = eye(size(inv_arg)) + inv_arg;
X1_single = H1'/inv_arg*H1;
[Q1_single,C1_single] = ratemaxQk(X1_single,Ptx);
% User 2, Single
inv_arg = H1*Q1*H1';
inv_arg = eye(size(inv_arg)) + inv_arg;
X2_single = H2'/inv_arg*H2;
[Q2_single,C2_single] = ratemaxQk(X2_single,Ptx);