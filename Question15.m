clear all
clc
load('exampleMAC')
S = 20;
Ptx = [0;0];
P = 10.^(Ptx/10);
[R] = ParetoBound(H,P,S);

[fig] = plotRegionMAC(R);