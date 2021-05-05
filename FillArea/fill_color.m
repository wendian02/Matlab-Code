%% paint color between curve
% Author: wendian

clc; clear; close all;
x = linspace(0, 10, 100);
y1 = sin(x);
y2 = cos(x);
y1 = sin(x)-0.25;
y2 = sin(x)+0.25;

plot(x, y1, x, y2, 'LineWidth', 1.5)
hold on
% method 1
area = fill([x fliplr(x)],[y1 fliplr(y2)],[0.93333, 0.83529, 0.82353],...
    'edgealpha', '0', 'facealpha', '.5'); 
% method 2
% patch([x fliplr(x)],[y1 fliplr(y2)], [0.93333, 0.83529, 0.82353],...
%     'edgealpha', '0', 'facealpha', '.5')

legend({'y1', 'y2', 'area'})
legend('boxoff', 'Location', 'best')

% setting
xlabel('x');
ylabel('y');
set(gca...
    , 'box', 'on','fontname','Times New Roman','fontsize', 16,'linewidth', 1,...
    'xcolor', 'k', 'ycolor', 'k');
set(gca, 'ylim', [-1.5 1.5]);

% save
print(gcf, '-djpeg', '-r300', 'fill_area2'); 
