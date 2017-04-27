### k-近邻算法  
> 优点：精度高、对异常值不敏感、无数据输入假定。
缺点：计算复杂度高、空间复杂度高。
适用的数据范围：数值型和标成型。
### python程序清单
  ```python
  def classify(inX, dataSet, labels, k):
    dataSet_len = dataSet.shape[0];
    diffMat = tile(inX, (dataSet_len, 1)) - dataSet;
    sqDiffMat = diffMat**2;
    sqDiffMat_sum = sqDiffMat.sum(axis=1);
    distances = sqDiffMat**0.5;
    sortDisIndex = distances.argsort();
    classCount = {};
    for i in range(k):
      voteIlabel = labels[sortDisIndex[i]];
      classCount[voteIlabel] = classCount.get(voteIlabel, 0)+1;
    sortClassCount = sorted(classCount.iteritems(), key=operator.itemgetter(1), reverse=True)
    return soreClassCount[0][0];
  ```
### 补充numpy.argsort()函数与operator.itemgetter()函数
#### numpy.argsort()
> 参数 
>> array:排序的数组  
axis:0表示列，1表示行，默认-1最后一个轴  
kind:指定用于排序的算法有{'quictsort'、'mergesort'、'heapsort'}  
order:当有多个字段是指定比较哪个字段  

> 返回值  
>> 返回排序数组  

#### operator.itemgetter()  
> 用于获取对象的哪些维的数据，例子  
  ```python
  a = [1,2,3];
  b = operator.itemgetter(1);
  print b(a);
  ```  
> 输出为 2  
***注意该函数获取的不是值，即返回的不是值而是一个函数，只有作用到对象上才能得到值。***
### 程序清单，将文本记录转换为Numpy的解析程序  
  ```python
  def file2matrix(filename):
    fr = open(filename)
    arrayLines = fr.readlines()
    numberOfLines = len(arrayLines)
    returnMat = zeros((numberOfLines, 3))
    classLabelVector = []
    index = 0
    for line in arrayOfLines:
      line = line.strip()
      listFromLine = line.split('\t')
      returnMat[index,:] = listFromLine[0:3]
      classLabelVector.append(int(listFromLine[-1]))
      index += 1
    return returnMat,classLabelVector
  ```
