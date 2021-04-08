% refer: https://stackoverflow.com/questions/6777609/fast-2dimensional-histograming-in-matlab
clc; clear

% some random data
X = randn(2500,1);
Y = randn(2500,1);

% bin centers (integers), let the number of xbins equals ybins
xbins = linspace(floor(min(X)), ceil(max(X)), 50);
ybins = linspace(floor(min(Y)), ceil(max(Y)), 50);
% xbins = linspace(xmin, xmax, 90);
% ybins = linspace(ymin, ymax, 90);

% xbins = floor(min(X)):.3:ceil(max(X));
% ybins = floor(min(Y)):.5:ceil(max(Y));
xNumBins = numel(xbins); 
yNumBins = numel(ybins);

% map X/Y values to bin indices
Xi = round( interp1(xbins, 1:xNumBins, X, 'linear', 'extrap') );
Yi = round( interp1(ybins, 1:yNumBins, Y, 'linear', 'extrap') );

% limit indices to the range [1,numBins]
% Xi = max( min(Xi,xNumBins), 1);
% Yi = max( min(Yi,yNumBins), 1);

% count number of elements in each bin
H = accumarray([Yi(:) Xi(:)], 1, [yNumBins xNumBins]);

% plot 2D histogram
imagesc(xbins, ybins, H)
axis on % axis image


cm = colormap('jet');
cm(1, :) = [1 1 1];  % set the 0 value as blank
colormap(cm)
colorbar
