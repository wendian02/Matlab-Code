% yyaxis tips 
% make the right axis on the top
% wendylay 20210225
% refer links: https://stackoverflow.com/questions/37709988/plot-line-chart-on-the-left-axis-uper-the-bar-chart-on-the-right-axis

% method 1
days = 0:5:35;
conc = [515 420 370 250 135 120 60 20];
temp = [29 23 27 25 20 23 23 17];
yyaxis right
b = bar(days, temp, 'FaceColor', [0.8 0.8 0.8]);
yyaxis left
p = plot(days, conc, 'LineWidth', 2);
set(gca, 'SortMethod', 'depth')

% method 2
days = 0:5:35;
conc = [515 420 370 250 135 120 60 20];

figure
yyaxis left
p1 = plot(days, conc, 'LineWidth', 4);
yyaxis right
p2 = plot(days, fliplr(conc), 'LineWidth', 4);
get(gca,'SortMethod')
set(gca, 'SortMethod', 'depth')
p1.ZData = ones(size(p1.XData));
p2.ZData = zeros(size(p2.XData));
