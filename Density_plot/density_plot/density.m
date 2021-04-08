%% Example: Scatter plot with color indicating data density
% refer: scatter plot function links: https://mathworks.com/matlabcentral/fileexchange/8577-scatplot
% author: Wendylay
% 20210118

% read data
clc ; clear ; close all
x = randn(2500,1);
y = randn(2500,1)*2;

% drawing
method = 'circles';
radius = [];
N = [];  
n = [];
po = [];
ms = 20;

figure('Position',[100,100,1000,900], 'units', 'normalized', 'color','w')  % [left bottom width height] 
hold on
%  set the 1:1 line
h_oneline = plot([min(x) max(x)], [min(y) max(y)], 'r', 'linewidth', 2);

colormap jet
scatplot(x, y, method,radius,N,n,po,ms);
hc = colorbar;

% legend the 1:1 line
legend(h_oneline, '1:1', 'fontsize', 30);
legend('boxoff')

% figure setting
set(gca,'box', 'on','fontname','times','fontsize', 16,'linewidth', 2,...
    'xcolor', 'k', 'ycolor', 'k');
xlabel('X ','fontname','Times New Roman','color','k', 'fontsize', 20);
ylabel('Y','fontname','Times New Roman','color','k', 'fontsize', 20);
axis square

