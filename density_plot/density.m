%% Example: Scatter plot with color indicating data density
% Wendain Lai
% scatter plot function links: https://jp.mathworks.com/matlabcentral/fileexchange/8577-scatplot

%% 读取数据
clc ; clear ;
load *.mat  % load data, contain x: true/synthetic data,   y: predicted/estimated data

% assessment index
r = corrcoef(x, y);
r2 = r(1,2)^2;
MAPE = mean(abs((y - x)./ x))*100; 
RMSE = sqrt(mean((x - y) .^ 2));
Mean_ratio = mean(y ./ x);

% another way to get assessment index: using fitlm (matlab function)
% assessment figure: taylordiag links: https://mp.weixin.qq.com/s?__biz=MzUxMzk4MjEwNg==&mid=2247484335&idx=1&sn=340c1e90093ad97aea6683e395e21428&chksm=f94da85ace3a214cf1d61f7d46f223b8c0b8a723cf0af19a169095548c2ab6d2850d68b869ee&token=70971684&lang=zh_CN#rd


xmin = 10^-3;
xmax = 10;
ymin = 10^-3;
ymax = 10;
%% validation
method = 'circles';
radius = sqrt((range(x)/30)^2 + (range(y)/30)^2);
N = 100; % size of the square mesh
n = 5;
po = 1;
ms = 22;

scatplot(x, y, method,radius,N,n,po,ms);
set(gca, 'yscale', 'log', 'xscale', 'log', 'xlim', [xmin xmax], 'ylim', [ymin ymax]...
    , 'box', 'on','fontname','Times New Roman','fontsize', 14,'linewidth', 1.2,...
    'xcolor', 'k', 'ycolor', 'k');
xlabel(' In situ measured C (mg m^{-3}) ','fontname','Times New Roman','color','k', 'fontsize', 20);
ylabel([algae ' (mg m^{-3})'],'fontname','Times New Roman','color','k', 'fontsize', 20);
axis square

set(gcf, 'position', [400 150 500 500]);  % delete the surrounding white space

%  set the 1:1 line
hold on
oneLine = plot([xmin xmax], [ymin ymax], 'r', 'linewidth', 1.2);
legend = legend(oneLine, '1:1 line');
set(legend,'position', 'best','box','off','fontname','Times New Roman', 'fontsize', 18,...
    'color','b');

% assessment index
sR2 = sprintf('R^{2} = %0.2f', r2);
sMAPE = sprintf('MAPE = %0.2f ', MAPE);
sRMSE = sprintf('RMSE = %0.3f mg m^{-3}', RMSE);
sMean_ratio = sprintf('Mean ratio = %0.2f', Mean_ratio);
text(0.1, 0.8,{sR2; [sMAPE '%'] ; sRMSE ; sMean_ratio}, ...
    'fontname','Times New Roman', 'fontsize', 18, ...
    'units', 'normalized')  % use normalized units

%% 图片保存
filedir = '';  % AP(absolute path)
filename = ['example.tif'];
print(gcf, '-dtiffn', '-r600', [ filedir filename]);   % figure with dpi = 600
close all;

