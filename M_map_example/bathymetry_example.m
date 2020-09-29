% Bathymetry example
% reference: m_map website

figure
m_proj('lambert','long',[-160 -115],'lat',[32 60]);
m_etopo2('contourf',[-7000:1000:-1000 -500 -200 0 ],'edgecolor','none');
% m_gshhs_f('patch',[.7 .7 .7],'edgecolor','none');  % hight resolution
m_gshhs('lc','patch', [.7 .7 .7], 'edgecolor','none');    % low resolution

m_grid('linest','none','tickdir','out','box','fancy','fontsize',16);

colormap(m_colmap('blues', 20));  

brighten(.5);    % Adjust brightness

caxis([-7000 000]);  
hc = colorbar;
hc.Position(4) = 0.2;
hc.Position(2) = 0.6;
set(get(hc, 'title'), 'string', 'depth (m)')


set(gcf,'color','w');  % otherwise 'print' turns lakes black
print(gcf, '-dtiffn', '-r300', 'bathymetry_example');
close all