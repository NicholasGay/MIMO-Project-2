%% Question 6
load('exampleMAC')
PtxdB = [-10, 0, 10];
Ptx = 10.^(PtxdB/10);

R = zeros(2,2,length(Ptx));
Rsum = zeros(1,length(Ptx));

fig = figure;
hold on
for i = 1:1:length(Ptx)
[R(:,:,i),Rsum(i)] = ratesMAC(Ptx(i)*Q,H);
r_D = [0; R(2,1,i)];
r_C = [R(1,2,i); 0];
fig = plotRegionMAC([r_D,R(:,:,i),r_C],fig);
end

legend(strcat(num2str(PtxdB(:))," dB"))
xlabel('R_1')
ylabel('R_2')

%% Question 7
disp(R)

