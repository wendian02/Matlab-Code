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
