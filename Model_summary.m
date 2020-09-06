%% Model for M file
% summary at 20191017 
% Wendian Lai
%% Read Chla from modis 
datadir=''; %指定批量数据所在的文件夹
filelist=dir([datadir,'*.nc']); %指定批量数据的类型
k=length(filelist); %nc文件个数

for s = 1:k
    datadir='*\'; %指定批量数据所在的文件夹
    filelist=dir([datadir,'*.nc']); %指定批量数据的类型
    k=length(filelist); %nc文件个数
    
    filename=[datadir,filelist(s).name];
    Chla=ncread(filename,'chlor_a'); %读入变量chla
    LonData  = ncread(filename,'lon'); %读入变量lon
    LatData  = ncread(filename,'lat')'; %读入变量lat
    
    value=Chla;% 确定需感兴趣的数组
    
    lonmin=117; lonmax=131;
    latmin=25; latmax=42;
    
    in1=find(LonData>=lonmin & LonData<=lonmax);
    in2=find(LatData>=latmin & LatData<=latmax);
    
    value_sub=value(in1,in2)';
    lon=LonData(in1);
    lat=LatData(in2);
    [LonData_re_sub,LatData_re_sub]=meshgrid(lon,lat);
    
    % 保存中间量Chla
    str = sprintf('Chla Month%d',s);%图像文件名命名
    save(str,'value_sub');
    
    %画图
    m_proj('mercator','lon',[lonmin lonmax],'lat',[latmin latmax]);
    hold on;
    h=m_pcolor(LonData_re_sub,LatData_re_sub,log10(value_sub));
    %h=m_pcolor(LonData_re,LatData_re,value);
    shading flat;
    
    caxis([log10(0.01) log10(65)]);
    colormap(jet)
    hc=colorbar;
    set(get(hc,'Title'),'string',' Chl a','fontname','Times New Roman');
    YT=[ log10(0.01) log10(0.1) log10(1) log10(10) log10(65)];
    set(hc,'YTick',YT,'YTickLabel',{'0.01','0.1','1','10','65'});
    
    m_gshhs_h('patch',[.5 .5 .5],'edgecolor','k');
    m_grid('box','fancy','tickdir','in');
    hold off
    str=sprintf('Month%d',s);%图像文件名命名
    figurename=[datadir,str];%图像文件名命名
    saveas(h,figurename,'tif'); %保存图像
    close all
    clear
end

%% Errors
r = corrcoef(x, y);
r2 = r(1,2)^2;
RMSE = sqrt(mean((x-y).^ 2));
MAPE = mean(abs(x-y)./ x)*100;
mean_ratio = mean(y ./ x);
clear r

%% Saving pictures
filedir = '*';
filename =  'algae.tif';
print(gcf, '-dtiffn', '-r600', [ filedir filename]); % save as tiff picture

%% Picture setting 
% setting axis peoperty
set(gca, 'xlim', [   ], 'ylim', [   ]...
    , 'box', 'on','fontname','Times New Roman','fontsize', 14,'linewidth', 1.2,...
    'xcolor', 'k', 'ycolor', 'k');
% setting fig location 
set(gca, 'Units', 'normalized', 'Position', [0.06 0.06 0.9 0.9])
set(get(h, 'title'), 'string', 'Depth (m)', 'fontname', 'Times New Roman','fontsize', 10);

%% Research area
lonmin=105;lonmax=125;
latmin=0;latmax=25;
figure
set(gcf, 'color', 'white','Units', 'normalized','position', [0.06 0.06 0.7 0.7]);
m_proj('Mercator','lon',[lonmin lonmax],'lat',[latmin latmax]);
m_gshhs_h('patch',[.7 .7 .7],'edgecolor',[.4 .4 .4]);  % Coastline
m_grid('linestyle','none','tickdir','in','linewidth',1.2,...
    'FontName','Times New Roman','FontSize',12);
% sea depth
[depth, lon, lat] = m_etopo2([lonmin lonmax latmin latmax]);
m_pcolor(lon, lat, -depth);
shading flat
caxis([0 100]);
map = zeros(256,3);
map(:,3) = (0:255)/255;
colormap(flipud(jet)); %颜色反转
hold on


% 绘制省界限
M = shaperead('provinces.shp');
provi_boudry_lon = [M(:).X];
provi_boudry_lat = [M(:).Y];
m_plot(provi_boudry_lon, provi_boudry_lat, 'k');
hold on
% text some points
m_line(126.5, 33.5,'marker','p','MarkerFaceColor','m','markersize',16,'color','k');
m_text(126.5, 34, '济州岛', 'color', 'k', 'fontsize', 16, 'fontweight', 'bold');

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

%% Next