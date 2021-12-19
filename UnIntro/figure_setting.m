%% Saving pictures
filedir = '**';
filename =  '**.tif';
print(gcf, '-dtiffn', '-r600', [ filedir filename]); % save as tiff picture

%% Picture setting 
% setting axis property
set(gca, 'xlim', [   ], 'ylim', [   ]...
    , 'box', 'on','fontname','Times New Roman','fontsize', 14,'linewidth', 1.2,...
    'xcolor', 'k', 'ycolor', 'k');
alpha(.5)  % 

% label property
xlabel('\lambda');
ylabel('***')

% setting fig location 
set(figure, 'Units', 'normalized', 'Position', [0.06 0.06 0.9 0.9])
set(gca, 'Units', 'normalized', 'Position', [0.06 0.06 0.9 0.9])
set(get(h, 'title'), 'string', 'Depth (m)', 'fontname', 'Times New Roman','fontsize', 10);

%% text 
str1 = 'AA';
str2 = 'BB';
text(0.1, 0.8,{str1; str2}, ...
    'fontname','Times New Roman', 'fontsize', 14, ...
    'units', 'normalized')  % use normalized units

