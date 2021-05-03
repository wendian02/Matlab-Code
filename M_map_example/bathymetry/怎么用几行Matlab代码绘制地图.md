# 1 M map介绍

[M map](https://www.eoas.ubc.ca/~rich/mapug.html#p8.6.2)工具包是Matlab绘制地图常用的工具包，打开M map官网的展览馆可以看到各种样式的地图。

![M map](E:\知乎文章\水深地图\M map.png)

从展览馆里点击自己喜欢的图表，就能看到绘制图片的相应代码，直接copy代码到Matlab script里面，run一下就能直接运用，整个过程只需三秒，心动不如行动，让我们直接开始！

# 2 M Map安装

1. 下载[M_map包](http://www.eos.ubc.ca/~rich/m_map1.4.tar.gz)
2. Matlab配置包。点击Add with Subfolders，选择刚下载并解压的M_map包。

![set path1](E:\知乎文章\水深地图\set path1.png)

![set path2](E:\知乎文章\水深地图\set path2.png)

# 3 绘图

从[官网](https://www.eoas.ubc.ca/~rich/map.html#gallery)中Gallery选择你需要的样式地图，复制代码，放入Matlab新建的Script中，run即可。

这里以水深地图作为例子

```Matlab
m_proj('lambert','long',[-160 -115],'lat',[32 60]); % 选择投影地图与图片经纬度范围

m_etopo2('contourf',[-7000:1000:-1000 -500 -200 0 ],'edgecolor','none');  % 绘制水深数据

m_gshhs('lc','patch', [.7 .7 .7], 'edgecolor','none');    % 绘制海岸线

m_grid('linest','none','tickdir','out','box','fancy','fontsize',16);  % 绘制经纬度网格

colormap(m_colmap('blues', 20));  % 设置水深色标

% 图片保存
print(gcf, '-dtiffn', '-r300', 'bathymetry_example');

```

运行这几行主要的代码就可以获得一幅简单的水深地图。

<img src="E:\4 Code\1 M File\1 Matlab TUT\M_map_example\bathymetry_example_lr.jpg" alt="bathymetry_example_lr" style="zoom:50%;" />



***Notes***

在官方文档中的**How to get M_Map**部分点击9.3就可以直接跳到水深数据的配置介绍文档，点击8.6就可以跳到高分辨率的海岸线配置介绍。**不想看英文的看我下面增加的Adding部分。**

![ETOP01_PATH](E:\OneDrive - stu.xmu.edu.cn\6 book and material\知乎文章\水深地图\ETOP01_PATH.jpg)

## Adding: matlab中高分辨率海岸线和水深具体配置

## 高分辨率海岸线配置

1. 下载：高分辨率海岸线下载[link](https://www.ngdc.noaa.gov/mgg/shorelines/data/gshhs/latest/)，这里选择**gshhg-bin**压缩包

2. 文件解压到相应路径，这里找到m_map包里面的private文件夹，把高清岸线解压进去
   ![高清岸线下载link](E:\OneDrive - stu.xmu.edu.cn\6 book and material\知乎文章\水深地图\高清岸线下载link.jpg)

3. m_map包中`m_gshhs.m`函数文件默认的路径一般是./private文件夹，想查看的话，一个简单的方法是：

   1. 在matlab里面的命令窗口输入m_gshhs，然后右键选择open selection。

      ![函数配置](E:\OneDrive - stu.xmu.edu.cn\6 book and material\知乎文章\水深地图\函数配置.jpg)

   2. 打开就可以查看函数默认的路径。

      ![函数配置2](E:\OneDrive - stu.xmu.edu.cn\6 book and material\知乎文章\水深地图\函数配置2.jpg)

## 高清水深配置

1. 下载高清水深数据，m_map官网给出的是NOAA官方的[etopo1(点击下载)](https://www.ngdc.noaa.gov/mgg/global/relief/ETOPO1/data/ice_surface/grid_registered/binary/etopo1_ice_g_i2.zip)数据。

2. 配置`m_etopo2`函数，方法与上面查看m_gshhs.m函数默认路径类似。

   1. 在matlab里面的命令窗口输入m_etopo2，然后右键选择open selection。

      ![函数配置2-1](E:\OneDrive - stu.xmu.edu.cn\6 book and material\知乎文章\水深地图\函数配置2-1.jpg)

   2. 更改默认路径为刚下载并解压之后的etopo1文件夹路径，注意文件夹最后以'/'结尾

      ![函数配置2-2](E:\OneDrive - stu.xmu.edu.cn\6 book and material\知乎文章\水深地图\函数配置2-2.jpg)

至此，两个文件夹配置均已完成。

---





