%% Read Chla from modis .nc files (in batch)

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