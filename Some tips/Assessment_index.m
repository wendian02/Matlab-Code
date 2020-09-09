%% Errors
r = corrcoef(x, y);
r2 = r(1,2)^2;
RMSE = sqrt(mean((x-y).^ 2));
MAPE = mean(abs(x-y)./ x)*100;
mean_ratio = mean(y ./ x);
clear r