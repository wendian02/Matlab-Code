%% 分布拟合及绘制频率分布直方图
x = randn(1000, 1);

% 画频率分布直方图
[counts,centers] = hist(x, 7);
figure
bar(centers, counts / sum(counts))

% 分布参数拟合
[mu,sigma]=normfit(x);

% 画已知分布的概率密度曲线
x1 = -4:0.1:4;
y1 = pdf('Normal', x1, mu,sigma);
hold on
plot(x1, y1)
