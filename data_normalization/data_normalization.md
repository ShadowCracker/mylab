## 介绍
> 在多指标评价体系中，由于各种评价指标的性质不同，通常具有不同的量纲和数量级。当各指标间的水平相差很大时，如果直接用原始指标值进行分析，  
就会突出数值较高的指标在综合分析中的作用，相对削弱数值较低的指标的作用。  
目前常用的方法有：min-max normalization， log函数转换， atan函数转换， z-score法， 模糊量化法。
### min-max normalization  
> ![一](http://yuenshome-wordpress.stor.sinaapp.com/uploads/2014/08/pic16.png)  
也叫离差标准化，是对原始数据的线性变换，使结果映射到[0,1]区间。代码实现：  
  ```python
  def autoNorm(dataSet):
    minVals = dataSet.min(0);
    maxVals = dataSet.max(0);
    ranges = maxVals - minVals;
    normDataSet = zeros(shape(dataSet));
    m = dataSet.shape[0];
    normDataSet = dataSet - tile(minVals, (m, 1));
    normDataSet = normDataSet/tile(ranges, (m, 1));
    return normDataSet, ranges, minVals;
  ```
### z-score normalization
> ![二](http://yuenshome-wordpress.stor.sinaapp.com/uploads/2014/08/pic23.png)  
这种方法基于原始数据的均值(mean)和标准差(standard deviation)进行数据的标准化。
***z-score标准化方法适用于属性A的最大值和最小值未知的情况，或有超出取值范围的离群数据。***  
### 归一化方法
> ![三](http://yuenshome-wordpress.stor.sinaapp.com/uploads/2014/08/pic33.png)
