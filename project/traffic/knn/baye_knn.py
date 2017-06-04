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
通过经纬度计算距离
'''
def distSLC(vecA, vecB):
    a = np.sin(vecA[1]*np.pi/180) * np.sin(vecB[1]*np.pi/180);
    b = np.cos(vecA[1]*np.pi/180) * np.cos(vecB[1]*np.pi/180) * np.cos(np.pi*(vecB[0]-vecA[0])/180);
    #print a+b;
    return '%.2f'%(np.arccos(a+b));
#     dis = (vecA[0] - vecB[0])**2 + (vecA[1] - vecB[1])**2;
#     dis = dis**0.5;
#     return '%.2f'%(dis);
'''
时间距离计算
'''
def disTim(vecA, vecB):
    return float(vecA[6] - vecB[6]);
'''
数据正规化
'''
def dataNorm(dataSet):
    minVals = dataSet.min();
    maxVals = dataSet.max();
    normDataSet = np.zeros(dataSet.shape);
    ranges = maxVals - minVals;
    normDataSet = dataSet - minVals;
    normDataSet = normDataSet/ranges;
    return normDataSet;
'''
计算MPE
'''
def calMpe(durPre, durAct):
    return sum((durPre-durAct)/durAct)/len(durAct);
'''
计算MAPE
'''
def calMape(durPre, durAct):
    return sum(abs((durPre-durAct)/durAct))/len(durAct);
'''
计算MSE
'''
def calMse(durPre, durAct):
    s = sum((durPre - durAct)**2)/len(durAct)
    return np.sqrt(s);
'''
主程序
'''
def bayeSian(k):
    fileName = '文件名';
    dataMat, dataLab = file2matrix(fileName, 9);
    durAct = dataMat[];
    testMat = dataMat[];
    count = 0;
#     testMat = dataMat[];
    testLab = np.array(dataLab[]);
    trainFraK = pd.DataFrame(dataMat,columns=[columns_name]);
    trainFra = trainFraK.ix[];
#     data_cla0 = trainFraK[trainFraK['T_TYPE']==0].values;
#     data_cla1 = trainFraK[trainFraK['T_TYPE']==1].values;
    trainInput = trainFraK[[columns_name]];
    trainArr = np.zeros((dataMat.shape[0], 4), dtype='int64');
    for arr in trainInput.values:
        trainArr[count, :]= map(int, arr);
        count += 1;
    trainInput = pd.DataFrame(trainArr, columns=[columns_name]);
    test = trainInput[];
    test = test.copy();
    test.drop('T_TYPE', axis=1, inplace=True);
    model = BayesianModel([('columns_name','columns_name'),('columns_name', 'columns_name'), ('columns_name', 'columns_name')]);
    model.fit(trainInput.ix[]);
    labelPre = model.predict(test);
    durPre = [];
    coef = 0.0;
    for i in range(len(testMat)):
        dataSet = trainFra[trainFra['T_TYPE']==labelPre['T_TYPE'][]].values;
        distPos = np.zeros(dataSet.shape[0]);
        distTim = np.zeros(dataSet.shape[0]);
        for j in range(dataSet.shape[0]):
            distPos[j] = distSLC(testMat[i], dataSet[j]);
            distTim[j] = disTim(testMat[i], dataSet[j]);
        distPosNor = distPos;#dataNorm(distPos);
        distTimNor = dataNorm(distTim);
        distAll = distPosNor*coef + distTimNor*(1-coef);
        knnIndex = distAll.argsort();
        durKnn = dataSet[knnIndex, 7][:k];
        durPre.append(sum(durKnn)/len(durKnn));
    mse = calMse(durPre, durAct);
    mape = calMape(durPre, durAct);
    count = 0;
    #print labelPre.values.tolist();
    for i in range(len(labelPre)):
        if labelPre.values[i]==testLab[i]:
            count += 1;
    print 'K: ', k;
    print '准确度: ', float(count)/len(testLab);
    print 'MSE: ', mse;
    print 'MAPE: ', mape;
    print '----------------------------------------------------------------------';
if __name__=='__main__':
    kValues = [参数];
    for i in kValues:
        bayeSian(i);

    