#-*- coding:utf-8 -*-
import numpy as np
import operator
import pandas as pd
from pgmpy.models import BayesianModel

'''
读取数据转换成Numpy的解析程序
'''
def file2matrix(filename, col_len):
    fr = open(filename);
    fileLines = fr.readlines()[1:];
    lines_len = len(fileLines);
    returnMat = np.zeros((lines_len, col_len));
    labelVactor = [];
    index = 0;
    for line in fileLines:
        line = line.strip();
        listFromLines = line.split(',');
        returnMat[index,:] = listFromLines[0:9];
        labelVactor.append(int(listFromLines[-1]));
        index += 1;
    return returnMat, labelVactor
'''
主程序
'''
def bayeSian():
    fileName = '文件地址';
    dataMat, dataLab = file2matrix(fileName, 9);
    
    count = 0;
#     testMat = dataMat[];
    testLab = np.array(dataLab[]);
#     testFra = pd.DataFrame(testMat, columns=[columns_name]);

    trainFraK = pd.DataFrame(dataMat,columns=[columns_name]);
    trainInput = trainFraK[[]];
    trainArr = np.zeros((dataMat.shape[0], 3), dtype='int64');
    for arr in trainInput.values:
        trainArr[count, :]= map(int, arr);
        count += 1;
    trainInput = pd.DataFrame(trainArr, columns=[]);
    test = trainInput[];
    test = test.copy();
    test.drop('T_TYPE', axis=1, inplace=True);
    model = BayesianModel([(), ()]);
    model.fit(trainInput.ix[]);
    labelPre = model.predict(test);
    count = 0;
    print labelPre.values.shape;
    for i in range(len(labelPre)):
        if labelPre.values[i]==testLab[i]:
            count += 1;
    print '准确度：', float(count)/len(testLab);
if __name__=='__main__':
    bayeSian();
    