%%  read landset8  .h5 file
% 20191012
clc; clear; close all;
datadir = 'D:\Landset8\LC08_L1TP_012031_20171004_20171014_01_T1\';
filename = 'L2017277152721.h5';
ncdisp([datadir filename])
Rrc_482 = ncread([datadir, filename],'bands/rhos_482');
Rrc_561 = ncread([datadir, filename],'bands/rhos_561');
Rrc_655 = ncread([datadir, filename],'bands/rhos_655');
Rrc_865 = ncread([datadir, filename],'bands/rhos_865');
Rrc_865(Rrc_865 <= 0) = nan;
Rrc_655(Rrc_655 <= 0) = nan;
Rrc_561(Rrc_561 <= 0) = nan;
Rrc_482(Rrc_482 <= 0) = nan;

% NDVI 
NDVI = (Rrc_865 + Rrc_655) ./ ( Rrc_865 - Rrc_655);
index = find(NDVI > 0); % land pixel
Rrc_865(index) =  nan; % remove land and cloud pixels
Rrc_561(index) =  nan;
Rrc_482(index) =  nan;

