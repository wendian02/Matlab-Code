% provinces example
% refer: m_map website
% 20210408

figure
set(gcf,'color','w');  % otherwise 'print' turns lakes black

m_proj('lambert','long',[100 135],'lat',[10 40]);
m_etopo2('contourf',[-7000:1000:-1000 -500 -200 0 ],'edgecolor','none');

% m_gshhs_f('patch',[.7 .7 .7],'edgecolor','none');  % hight resolution
% m_gshhs('fc','patch', [.7 .7 .7], 'edgecolor','none');  % hight resolution
m_gshhs('lc','patch', [.7 .7 .7], 'edgecolor','none');    % low resolution

% m_gshhs('fb2','linewidth', 1.5)

% 1 Add country lines
    % method a (m_map offical website)
M = m_shaperead('..\..\2 Supporting files\shape_files\ne_10m_admin_0_countries\ne_10m_admin_0_countries'); 
for k = 1 : length(M.ncst)
     m_line(M.ncst{k}(:,1),M.ncst{k}(:,2), 'linewidth', 1); 
end

    % method b
% M = shaperead('C:\Users\OOL\Desktop\ne_10m_ocean.shp');
% provi_boudry_lon = [M(:).X];
% provi_boudry_lat = [M(:).Y];
% m_plot(provi_boudry_lon, provi_boudry_lat, 'b', 'linewidth', 1.5);


% 2 Add provinces lines
M = shaperead('..\..\2 Supporting files\shape_files\ne_10m_admin_1_states_provinces\ne_10m_admin_1_states_provinces.shp'); 
provi_boudry_lon = [M(:).X];
provi_boudry_lat = [M(:).Y];
m_line(provi_boudry_lon, provi_boudry_lat, 'color', [118,125,135]./255, 'linewidth', 0.5);

m_grid('linest','none','tickdir','in','box','fancy','fontsize',16);

colormap(m_colmap('blues', 20));  

brighten(.5);    % Adjust brightness

