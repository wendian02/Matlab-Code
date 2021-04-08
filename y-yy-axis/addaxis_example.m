clear; close all;
% create dummy data
x = 1:10;
y1 = rand(1, 10);
y2 = rand(1, 10)*10;
y3 = rand(1, 10)*100;
% create Figure f
f = figure('color', 'white','Units', 'normalized','position', [0.06 0.06 0.7 0.7]);
% create Axes ax1
ax1 = axes('Parent', f);
ax1.NextPlot = 'replacechildren';
set(ax1, 'LineWidth', 1.5, 'fontname', 'times', 'FontSize', 24, 'FontWeight', 'bold', ...
    'XLim', [0, 10], 'position', [0.1, 0.15, 0.7, 0.8])
xlabel('Latitude [^o]', 'FontSize', 28, 'FontWeight', 'bold')
ylabel('H_{Lidar} [m]', 'FontSize', 28, 'FontWeight', 'bold')

% create invisible Axes ax2
ax2 = axes('Parent', f);
ax2.NextPlot = 'replacechildren';
ax2.Color = 'none';
ax2.XAxis.Visible = 'off';
ax2.YAxis.Visible = 'off';
ax2.YAxisLocation = 'right';
set(ax2, 'LineWidth', 1.5, 'fontname', 'times', 'FontSize', 24, 'FontWeight', 'bold', ...
    'XLim', [0, 10], 'position', [0.1, 0.15, 0.7, 0.8])


% create invisible Axes ax3
ax3 = axes('Parent', f);
ax3.NextPlot = 'replacechildren';
ax3.Color = 'none';
ax3.XAxis.Visible = 'off';
ax3.YAxis.Visible = 'off';
ax3.YAxisLocation = 'right';
set(ax3, 'LineWidth', 1.5, 'fontname', 'times', 'FontSize', 24, 'FontWeight', 'bold', ...
    'XLim', [0, 10], 'position', [0.1, 0.15, 0.7, 0.8])

% plot scatter data x, y1, y2, y3
h1 = scatter(ax1, x, y1, 'ro');
h2 = scatter(ax2, x, y2, 'gx');
h3 = scatter(ax3, x, y3, 'b*');

% create dummy Axes, dAx1
dAx1 = ax1;
dAx1.YColor = 'k';


% create dummy Axes, dAx2 with right YAxis
dAx2 = axes('Parent', f);
dAx2.YColor = 'g';
dAx2.Color = 'none';
dAx2.XAxis.Visible = 'off';
dAx2.YAxisLocation = 'right';
dAx2.YLim = ax2.YLim;
set(dAx2, 'LineWidth', 1.5, 'fontname', 'times', 'FontSize', 24, 'FontWeight', 'bold', ...
    'XLim', [0, 10], 'position', [0.1, 0.15, 0.7, 0.8])
ylabel('ARE_{H}', 'FontSize', 28, 'FontWeight', 'bold')
% create dummy Axes, dAx3 with offset YAxis
dAx3 = axes('Parent', f);
dAx3.YColor = 'b';
dAx3.Color = 'none';
dAx3.XAxis.Visible = 'off';
dAx3.YAxisLocation = 'right';

Pos = ax2.Position;
dAx3.Position = Pos + [0.1 0 0 0];
dAx3.YLim = ax3.YLim;
set(dAx3, 'LineWidth', 1.5, 'fontname', 'times', 'FontSize', 24, 'FontWeight', 'bold', ...
    'XLim', [0, 10])
ylabel('QS', 'FontSize', 28, 'FontWeight', 'bold')
