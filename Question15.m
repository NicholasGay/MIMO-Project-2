close all
clear all
clc
load('exampleMAC')
S = 20;
PtxdB = [-10, 0, 10];
Ptx = 10.^(PtxdB/10);
P(1,:) = Ptx;
P(2,:) = Ptx;
fig  = figure;
hold on
for i = 1:size(P,2)
[R] = ParetoBound(H,P(:,i),S);

%% Plotting rectangular for reference not needed actually

rectangle = [R(:,1),[R(1,end);R(2,1)],R(:,end)];
rectplot = plot(rectangle(1,:),rectangle(2,:),'--k','HandleVisibility','off');
triangle = [R(:,1),R(:,end)];
triplot = plot(triangle(1,:),triangle(2,:),':k','HandleVisibility','off');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fig = plotRegionMAC(R,fig);


end
legend('-10 dB','0 dB','10 dB')
xlabel('R_1')
ylabel('R_2')