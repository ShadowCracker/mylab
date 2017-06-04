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
计算距离的程序
'''
def calDist(inX, dataSet, labels, k, weight):
    dataSetSize = dataSet.shape[0];
    diffMat = np.tile(inX, (dataSetSize, 1)) - dataSet;
    sqDiffMat = diffMat**2;
    sqDiffMatWgh = sqDiffMat*weight;
    sqDistance = sqDiffMatWgh.sum(axis=1);
    distances = sqDistance**0.5;
    sortedDistIndexs = distances.argsort();
    classCount = {};
    for i in range(k):
        index = labels[sortedDistIndexs[i]];
        classCount[index] = classCount.get(index, 0) + 1;
    sortedClassCount = sorted(classCount.iteritems(), key=operator.itemgetter(1), reverse=True);
    return sortedClassCount[0][0];
'''
通过经纬度计算距离
'''
def distSLC(vecA, vecB):
    a = np.sin(vecA[1]*np.pi/180) * np.sin(vecB[1]*np.pi/180);
    b = np.cos(vecA[1]*np.pi/180) * np.cos(vecB[1]*np.pi/180) * np.cos(np.pi*(vecB[0]-vecA[0])/180);
    return '%.2f'%(np.arccos(a+b)*6371.0);
'''
时间距离计算
'''
def disTim(vecA, vecB):
    return '%.2f'%(float(vecA[6] - vecB[6]));
'''
数据正规化
'''
def dataNorm(dataSet):
    minVals = dataSet.min(1);
    maxVals = dataSet.max(1);
    normDataSet = np.zeros(dataSet.shape);
    ranges = (maxVals - minVals).reshape((dataSet.shape[0], 1));
    normDataSet = dataSet - minVals.reshape((dataSet.shape[0], 1));
    normDataSet = normDataSet/ranges;
    return normDataSet;
'''
获取索引值
'''
def getLabel(labels):
    index = 0;
    classCount = {};
    for i in range(len(labels)):
        voteIlabel = labels[i];
        classCount[voteIlabel] = classCount.get(voteIlabel, 0)+1;
    sortedClassCount = sorted(classCount.iteritems(), key=operator.itemgetter(1), reverse=True);
    return sortedClassCount[0][0];
        
'''
主程序
'''
def kNN(k):
    fileName = '';
    dataMat, dataLab = file2matrix(fileName, 9);
    trainMat = dataMat[];
    trainLab = np.array(dataLab[]);
    testMat = dataMat[];
    testLab = np.array(dataLab[]);
    coef = 1;
    distPos = np.zeros((testMat.shape[0], trainMat.shape[0]));
    distTim = np.zeros((testMat.shape[0], trainMat.shape[0]));
    for i in range(testMat.shape[0]):
        for j in range(trainMat.shape[0]):
            distPos[i,j] = distSLC(testMat[i], trainMat[j]);
            distTim[i,j] = disTim(testMat[i], trainMat[j]);
    distPosNor = dataNorm(distPos);
    distTimNor = dataNorm(distTim);
    distAll = distPosNor*coef + distTimNor*(1-coef);
    distIndex = distAll.argsort();
    testI = np.zeros((testMat.shape[0], 4), dtype='int32');
    count = 0;
    for i in testMat[:, 2:6]:
        testI[count,:] = map(int, i);
        count += 1;
    testInput = pd.DataFrame(testI, columns=[]);
    trainMatK = trainMat[distIndex[:,0:k]];
    labelPre = [];
    for i in range(len(trainMatK)):
        num = 0;
        trainI = np.zeros((trainMatK[0].shape[0], 5), dtype='int32');
        for j in trainMatK[i][:, [2,3,4,5,8]]:
            trainI[num, :] = map(int, j);
            num += 1;
        trainFraK = pd.DataFrame(trainI,columns=[]);
        trainInput = trainFraK[[]];
        model = BayesianModel([(),(),(), ()]);
        model.fit(trainInput);
        a = pd.DataFrame([testInput.ix[i].values.tolist()], columns=[]);
        labelPre.append(model.predict(a).values[0][0]);
#     for i in range(len(testLakK)):
#         labels = testLakK[i];
#         labelPre.append(getLabel(labels));
    count = 0;
    #print labelPre;
    for i in range(len(labelPre)):
        if labelPre[i]==testLab[i]:
            count += 1;
    print '准确度：', float(count)/len(testLab);
if __name__ == '__main__':
    kNN(300);