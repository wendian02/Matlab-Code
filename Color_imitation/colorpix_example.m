% script for colorpix example
% nature journal link: https://webvpn.xmu.edu.cn/https/77726476706e69737468656265737421e7e056d229317c456c0dc7af9758/articles/s41586-020-03119-1/figures/2

Moderate = [253,163,98] ./ 255;
Strong = [254,112,85] ./ 255;
Severe = [207,47,51] ./ 255;
Extreme = [133,52,61] ./ 255;

x = linspace(1, 10, 100);
rd = rand(size(x));
y1 = log(x) * 0.5 + rd;
y2 = log(x) + rd;
y3 = log(x) * 2 + rd;
y4 = log(x) * 3 + rd;

figure
hold on
fill([x, fliplr(x)], [y1, zeros(size(y1))], Moderate,...
    'EdgeColor', 'None', 'FaceAlpha', 0.5)
fill([x, fliplr(x)], [y2, fliplr(y1)], Strong,...
    'EdgeColor', 'None', 'FaceAlpha', 0.9)
fill([x, fliplr(x)], [y3, fliplr(y2)], Severe,...
    'EdgeColor', 'None', 'FaceAlpha', 0.9)
fill([x, fliplr(x)], [y4, fliplr(y3)], Extreme,...
    'EdgeColor', 'None', 'FaceAlpha', 0.9)


plot(x, y1, 'color', Severe - 0.1, 'LineWidth', 1.5)
plot(x, y2, 'color', Severe - 0.1, 'LineWidth', 1.5)
plot(x, y3, 'color', Extreme - 0.1, 'LineWidth', 1.5)
plot(x, y4, 'color', Extreme - 0.1, 'LineWidth', 1.5)

set(gca, 'linewidth', 1.25, 'fontsize', 16,...
    'xcolor', 'k', 'ycolor', 'k', ...
    'xlim', [0.9, 10.1])
box on
% print(gcf, '-djpeg', '-r300', 'imitation.jpg')

%% scatter 
rng(0)
light_blue = [216,220,254] ./ 255;
light_red = [250,220,218] ./ 255;
x = 1 : 10;
y = randn(size(x)) * 3;
y2 = rand(size(x)) * 3;

figure
hold on
x_l = 0 : 11;
ml = zeros(size(x_l));
ul = ones(size(x_l)) * 5;
ll = ones(size(x_l)) * -5;
plot(x_l, ml, 'color', light_red - 0.1, 'LineWidth', 1.5)
plot(x_l, ul, 'color', light_blue - 0.1, 'LineWidth', 1.5)
plot(x_l, ll, 'color', light_blue - 0.1, 'LineWidth', 1.5)
fill([x_l, fliplr(x_l)], [ul, ll], light_blue, ...
    'EdgeColor', 'None', 'FaceAlpha', 0.3)

scatter(x, y, 150, ...
    'MarkerFaceColor', light_blue,...
    'MarkerEdgeColor', light_blue - 0.1,'LineWidth', 1.5)
hold on
scatter(x, y2, 150, ...
    'MarkerFaceColor', light_red,...
    'MarkerEdgeColor', light_red - 0.1,'LineWidth', 1.5, ...
    'Marker', 's')

set(gca, 'linewidth', 1.25, 'fontsize', 16,...
    'xcolor', 'k', 'ycolor', 'k', ...
    'xlim', [0, 11])
box on
% print(gcf, '-djpeg', '-r300', 'light_scatter.jpg')