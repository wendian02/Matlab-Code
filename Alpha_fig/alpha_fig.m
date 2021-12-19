%% alpha show

% wendylay
% 2021.12.19

clc; clear; close all;
rng(0)
%% generate data
n_p = 20;

x1 = randn(1, n_p) + randn(1, n_p) * 1;
y1 = randn(1, n_p) + randn(1, n_p) * 2;

x2 = randn(1, n_p) + randn(1, n_p) * 1;
y2 = randn(1, n_p) + randn(1, n_p) * 2;

for idx = 1 : n_p
    if mod(idx, 2) ~= 1
        x2(idx) = x1(idx) + randn(1) .* 0.5;
        y2(idx) = y1(idx) + randn(1) .* 0.5;
    end
end

% scatter(x1, y1, 100, 's', 'MarkerFaceColor', 'b');
% alpha(.1)
% hold on 
% scatter(x2, y2, 100, '^', 'MarkerFaceColor', 'r');



%% figure
rng(0)
light_blue = [216,220,254] ./ 255;
light_red = [250,220,218] ./ 255;

%% no alpha
figure
scatter(x1, y1, 150, ...
    'MarkerFaceColor', light_blue,...
    'MarkerEdgeColor', light_blue - 0.3,'LineWidth', 1.5)
hold on
scatter(x2, y2, 150, ...
    'MarkerFaceColor', light_red,...
    'MarkerEdgeColor', light_red - 0.3,'LineWidth', 1.5, ...
    'Marker', 's')
set(gca, 'linewidth', 1.25, 'fontsize', 16,...
    'xcolor', 'k', 'ycolor', 'k')
box on
print(gcf, '-djpeg', '-r300', 'no_alpha.jpg')
close all

%% Face and Edge Alpha
figure
scatter(x1, y1, 150, ...
    'MarkerFaceColor', light_blue,...
    'MarkerEdgeColor', light_blue - 0.3,...
    'LineWidth', 1.5,...
    'MarkerFaceAlpha', 0.6, ...
    'MarkerEdgeAlpha', 0.8)
hold on
scatter(x2, y2, 150, ...
    'MarkerFaceColor', light_red,...
    'MarkerEdgeColor', light_red - 0.3,'LineWidth', 1.5, ...
    'Marker', 's',...
    'MarkerFaceAlpha', 0.6,...
    'MarkerEdgeAlpha', 0.8)

set(gca, 'linewidth', 1.25, 'fontsize', 16,...
    'xcolor', 'k', 'ycolor', 'k')
box on
print(gcf, '-djpeg', '-r300', 'alpha_face_edge.jpg')
close all
%%  Figure alpha
figure
scatter(x1, y1, 150, ...
    'MarkerFaceColor', light_blue,...
    'MarkerEdgeColor', light_blue - 0.3,'LineWidth', 1.5)
hold on
scatter(x2, y2, 150, ...
    'MarkerFaceColor', light_red,...
    'MarkerEdgeColor', light_red - 0.3,'LineWidth', 1.5, ...
    'Marker', 's')
set(gca, 'linewidth', 1.25, 'fontsize', 16,...
    'xcolor', 'k', 'ycolor', 'k')
box on
alpha(1)
print(gcf, '-djpeg', '-r300', 'alpha_all_figure.jpg')
close all