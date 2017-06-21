#-*- coding:utf-8 -*-
import matplotlib
import matplotlib.pyplot as plt
import numpy as np
from kMeans import *
from bikMeans import biKMeans
'''
计算球面距离
'''
def distSLC(vecA, vecB):
    a = np.sin(vecA[0,1]*np.pi/180) * np.sin(vecB[0,1]*np.pi/180);
    b = np.cos(vecA[0,1]*np.pi/180) * np.cos(vecB[0,1]*np.pi/180) * np.cos(np.pi*(vecB[0,0]-vecA[0,0])/180);
    return np.arccos(a+b)*6371.0;
'''
封装了计算k近邻以及作图train/input_ano.csv
'''
def clusterClubs(numClust=5):
    datList = [];
    for line in open('').readlines():
        lineArr = line.split(',');
        datList.append([float(lineArr[0]), float(lineArr[1])]);
    datMat = np.mat(datList);
    myCentroids, clustAssing = biKMeans(datMat, numClust, distMeas=distSLC);
    print myCentroids;
    fig = plt.figure();
    rect = [0.1,0.1,0.8,0.8];
    scatterMarkers = ['s','o','^','8','p','d','v','h','>','<'];
    scatterColors = ['b', 'g', 'k', 'r', 'y', 'c', 'm'];
    axprops = dict(xticks=[], yticks=[]);
    ax0 = fig.add_axes(rect, label='ax0', **axprops);
    imgp = plt.imread('F:/yloves/Prediction-Open/data/empty.png');
    ax0.imshow(imgp);
    ax1 = fig.add_axes(rect, label='ax1', frameon=False);
    for i in range(numClust):
        ptsInCurrCluster = datMat[np.nonzero(clustAssing[:,0].A==i)[0],:];
        markerStyle = scatterMarkers[i%len(scatterMarkers)];
        color = scatterColors[i%len(scatterColors)];
        ax1.scatter(ptsInCurrCluster[:,0].flatten().A[0],ptsInCurrCluster[:,1].flatten().A[0],c=color,marker=markerStyle, s=90);
    ax1.scatter(myCentroids[:,0].flatten().A[0],myCentroids[:,1].flatten().A[0], c= 'r',marker='+', s=300);
    plt.show();

if __name__ == '__main__':
    clusterClubs();