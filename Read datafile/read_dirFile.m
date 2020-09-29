%% dir read data in excel file 
% wendian Lai
clc; clear; close all;
file_dir = 'E:\';
file_stc = dir([file_dir '*.xlsx']);  % list of .xlsx files in file_dir
                                           % if you want to read "txt" file, 
                                           % change '*.xlsx' with '*.txt'
for idx = 1 : length(file_stc)
    filename = [file_dir file_stc(idx).name];
    [ndata, name, ~] = xlsread(filename);  % new function: readmatrix/readcell
    
    % TO DO
    % *******
    % *******
end



