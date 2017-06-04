#-*- coding:utf-8 -*-
import numpy as np 

'''
加载数据
'''
def loadDataSet(filename):
    dataMat = [];
    fr = open(filename);
    for line in fr.readlines():
        fileList = line.strip().split('\t');
        fileList = map(float, fileList);
        dataMat.append(fileList);
    return dataMat;
'''
计算距离
'''
def calDist(dataA, dataB):
    return np.sqrt(np.sum(np.power(dataA-dataB, 2)));
'''
构建初始簇质心
'''
def randCent(dataSet, k):
    n = np.shape(dataSet)[1];
    centroids = np.mat(np.zeros((k, n)));
    for j in range(n):
        a = dataSet[:,j];
        minJ = min(dataSet[:,j]);
        rangeJ = float(max(dataSet[:,j]) - minJ);
        centroids[:, j] = minJ + rangeJ * np.random.rand(k, 1);
    return centroids;
def kMeans(dataSet, k, distMeas=calDist, createCent=randCent):
    dataSetLen = np.shape(dataSet)[0];
    clusterArray = np.mat(np.zeros((dataSetLen, 2)));
    centroids = createCent(dataSet, k);
    flag = True;
    while flag:
        flag = False;
        for i in range(dataSetLen):
            minDist = np.inf;
            minIndex = -1;
            for j in range(k):
                distJI = distMeas(dataSet[i,:],centroids[j,:]);
                if distJI<minDist:
                    minDist = distJI;
                    minIndex = j;
            if clusterArray[i,0] != minIndex:
                flag = True;
            clusterArray[i,:] = minIndex, minDist**2;
        print centroids;
        for cent in range(k):
            clusterData = dataSet[np.nonzero(clusterArray[:, 0].A==cent)[0]];
            centroids[cent,:] = np.mean(clusterData, axis=0);
    return centroids, clusterArray;