function [fig] = plotRegionMAC(R,fig)
% Function [fig] = plotRegionMAC(R,fig)
%
% Plots the rate region of a two user MIMO MAC with R1
% as abscissa and R2 as ordinate.
%
% Inputs
% R: 2 x S matrix of rate region coordinates
% fig: figure handle for plotting the boundary into a given figure
% Outputs
% fig: figure handle to the figure of the plotted boundary

if nargin<2, fig = figure; end

% TODO
x = R(1,:);
y = R(2,:);

plot(x,y);