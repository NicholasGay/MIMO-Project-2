clear all
clc
close all
Ptx_dB = [0;0];
Ptx = 10.^(Ptx_dB/10);
load('exampleMAC')
epsilon = 10^(-4);
[Q,Csum,Rsum] = iterWaterfill(H,Ptx,epsilon);
Q1 = Q(:,:,1);
Q2 = Q(:,:,2);
