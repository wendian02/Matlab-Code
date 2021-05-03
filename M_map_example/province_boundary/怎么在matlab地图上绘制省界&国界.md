# 怎么在matlab地图上绘制省界&国界

​		先上效果图，可以看到浅灰色是省界，蓝色是**陆地上**的国界及海岸线（**注：领水国界未标，如果有需要最好手动用PPT标注**）。

![](D:\OneDrive - stu.xmu.edu.cn\4 Code\1 M File\1 Matlab TUT\M_map_example\provinces_example.jpg)

## 绘制步骤

### 1 前期m_map包设置及.shp准备

1.  配置水深地图，请参考我之前的[知乎文章：怎么使用几行Matlab代码绘制地图？](https://zhuanlan.zhihu.com/p/260434804)

2. 下载省界or国界.shp文件，直接点击[Natural Earth](https://www.naturalearthdata.com/features/)
   再点击10进入网站直接下载，除了省界，还有国界等.shp文件

## 2 绘制省界代码

**方法1：**官网给出的官方代码
`m_shaperead('path')`里面的path要写.shp文件放入的绝对路径下，并且这个路径中不仅要有.shp文件，还需要有.dbf&.shx，从上面的网站下载的压缩包解压之后会包含这些文件，路径注意**不要加.shp**，因为m_map包会自己识别三中类型文件。

```matlab
M = m_shaperead('..\..\2 Supporting files\shape_files\ne_10m_admin_0_countries\ne_10m_admin_0_countries'); 
for k = 1 : length(M.ncst)
     m_line(M.ncst{k}(:,1),M.ncst{k}(:,2), 'linewidth', 1); 
end
```

**方法2：使用m_line**

与刚才的`m_shaperead`有所区别，这里的路径读取到.shp，没有使用到另外两个文件

```matlab
M = shaperead('..\..\2 Supporting files\shape_files\ne_10m_admin_1_states_provinces\ne_10m_admin_1_states_provinces.shp'); 
provi_boudry_lon = [M(:).X];
provi_boudry_lat = [M(:).Y];
m_line(provi_boudry_lon, provi_boudry_lat, 'color', [118,125,135]./255, 'linewidth', 0.5);
```

**上述任一方法嵌入之前水深的代码块中，便可以获得即拥有水深，还有省界or国界的地图，各省地名用ppt手动增加，会比在matlab里面增加更加方便省力**

完整代码及无法科学上网获得省界和国界的朋友可以到我的[github](https://github.com/Wendian-github/Matlab-Code/blob/master/M_map_example/provinces_example.m)上下载。

---

