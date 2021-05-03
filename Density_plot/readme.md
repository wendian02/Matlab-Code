## 1 Scatplot

​	第一种方法是绘制density plot，使用mathwork中作者Alex Sanchez分享的scatplot绘制。matlab script的函数[链接](https://www.mathworks.com/matlabcentral/fileexchange/8577-scatplot)。作者也给出了使用这个代码的例子：

```matlab
po = 2;
method = 'squares';
radius = [];
N = [];
n = [];
ms = 5;
x = randn(1000,1);
y = randn(1000,1);

out = scatplot(x,y,method,radius,N,n,po,ms);
```

<u>你也可以直接在含有scatplot这个脚本的路径下直接在matlab的command window输入scatplot就可以看到如下图像。</u>

**其中输入参数的意义代表的是：**
**method: **
**radius: 计算密度的圆的半径**
**ms：绘制网格的大小**
**x： 横坐标数据**
**y：纵坐标数据**

​	这个方法最大的不足就是其定义的密度的方式比较难以理解。我绘制了一个图像来解释这个方程定义的密度的含义：

计算每一个点在radius范围内的其他点的个数，再以Di这个公式表示为密度，最后归一化这个Di以Din表示，使每一个点的Din值都在0-1之间，这样绘制出来的图像的对比度就比较明显。

## 2 Hist2d

**因为scatplot方法没有得到老板的认同，因此我选择了下面这种方法绘制密度图像，计算每个方块中的点的个数。**

在python中，我们可以使用matplotlib画图万能包很直接的获得这样的图像，直接使用[hist2d](https://matplotlib.org/api/_as_gen/matplotlib.pyplot.hist2d.html)绘制。*官方参考代码也给懒人一个[连接](https://matplotlib.org/gallery/scales/power_norm.html#sphx-glr-gallery-scales-power-norm-py)* 。但是不会python的人懒得使用matlab以外的代码，查了半天，终于找到了网上有[大佬](https://stackoverflow.com/questions/6777609/fast-2dimensional-histograming-in-matlab)给出了这类的代码。在这基础上，我做了小小修改，使得更加使用于我们的科研表达中。

```matlab
% some random data
X = randn(2500,1);
Y = randn(2500,1);

% bin centers (integers), let the number of xbins equals ybins
xbins = linspace(floor(min(X)), ceil(max(X)), 50);
ybins = linspace(floor(min(Y)), ceil(max(Y)), 50);

xNumBins = numel(xbins); 
yNumBins = numel(ybins);

% map X/Y values to bin indices
Xi = round( interp1(xbins, 1:xNumBins, X, 'linear', 'extrap') );
Yi = round( interp1(ybins, 1:yNumBins, Y, 'linear', 'extrap') );

% count number of elements in each bin
H = accumarray([Yi(:) Xi(:)], 1, [yNumBins xNumBins]);

% plot 2D histogram
imagesc(xbins, ybins, H)
axis on % axis image

cm = colormap('jet');
cm(1, :) = [1 1 1];  % set the 0 value as blank
colormap(cm)
colorbar
```

之前是这样的

现在是这样的

对比之后虽然现在像素风更加浓郁了，但是里面的物理含义更加清晰了，至于代码中每一行代表什么意思，注释中都有介绍，如果不懂可在下面留言。

我是一点知识，下期随缘~