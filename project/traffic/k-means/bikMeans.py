#-*- coding:utf-8 -*-
import matplotlib
import matplotlib.pyplot as plt
import numpy as np
from kMeans import *
'''
计算球面距离
'''
'''
def distSLC(vecA, vecB):
    a = np.sin(vecA[0,1]*np.pi/180) * np.sin(vecB[0,1]*np.pi/180);
    b = np.cos(vecA[0,1]*np.pi/180) * np.cos(vecB[0,1]*np.pi/180) * np.cos(np.pi*(vecB[0,0]-vecA[0,0])/180);
    return np.arccos(a+b)*6371.0;

def clusterClubs(numClust=5):
    datList = [];
    for line in open('F:/yloves/Prediction-Open/train/input_ano.csv').readlines()[1:1000]:
        lineArr = line.split(',');
        datList.append([float(lineArr[0]), float(lineArr[1])]);
    datMat = np.mat(datList);
    myCentroids, clustAssing = biKMeans(datMat, numClust, distMeas=distSLC);
    fig = plt.figure();
    rect = [0.1,0.1,0.8,0.8];
    scatterMarkers = ['s','o','^','8','p','d','v','h','>','<'];
    axprops = dict(xticks=[], yticks=[]);
    ax0 = fig.add_axes(rect, label='ax0', **axprops);
    imgp = plt.imread('F:/yloves/Prediction-Open/data/xiamen.png');
    ax0.imshow(imgp);
    ax1 = fig.add_axes(rect, label='ax1', frameon=False);
    for i in range(numClust):
        ptsInCurrCluster = datMat[np.nonzero(clustAssing[:,0].A==i)[0],:];
        markerStyle = scatterMarkers[i%len(scatterMarkers)];
        ax1.scatter(ptsInCurrCluster[:,0].flatten().A[0],ptsInCurrCluster[:,1].flatten().A[0],marker=markerStyle, s=90);
    ax1.scatter(myCentroids[:,0].flatten().A[0],myCentroids[:,1].flatten().A[0], marker='+', s=300);
    plt.show();
'''
def biKMeans(dataSet, k, distMeas):
    m = np.shape(dataSet)[0];
    clusterAssment = np.mat(np.zeros((m, 2)));
    a = np.mean(dataSet, axis=0).tolist();
    centroid0 = np.mean(dataSet, axis=0).tolist()[0];
    centList = [centroid0];
    for j in range(m):
        a = np.mat(centroid0);
        clusterAssment[j, 1] = distMeas(np.mat(centroid0), dataSet[j,:])**2;
        print a;
    while (len(centList)<k):
        lowestSSE = np.inf;
        for i in range(len(centList)):
            ptsInCurrCluster = dataSet[np.nonzero(clusterAssment[:, 0].A==i)[0],:];
            centroidMat, splitClustAss = kMeans(ptsInCurrCluster, 2, distMeas);
            sseSplit = sum(splitClustAss[:, 1]);
            sseNotSplit = sum(clusterAssment[np.nonzero(clusterAssment[:,0].A!=i)[0],1]);
            print "sseSplit, and notSplit: ",sseSplit,sseNotSplit;
            if (sseSplit+sseNotSplit)<lowestSSE:
                bestCentToSplit = i;
                bestNewCents = centroidMat;
                bestClustAss = splitClustAss.copy();
                lowestSSE = sseSplit + sseNotSplit;
        bestClustAss[np.nonzero(bestClustAss[:,0].A==1)[0], 0] = len(centList);
        bestClustAss[np.nonzero(bestClustAss[:,0].A==0)[0], 0] = bestCentToSplit;
        #print 'the bestCentToSplit is: ', bestCentToSplit;
        print 'the len of bestClustAss is: ', len(bestClustAss);
        centList[bestCentToSplit] = bestNewCents.getA().tolist()[0];
        #a = bestNewCents.getA().tolist()[0];
        centList.append(bestNewCents.getA().tolist()[1]);
        clusterAssment[np.nonzero(clusterAssment[:, 0].A==bestCentToSplit)[0],:]=bestClustAss;
    return np.mat(centList), clusterAssment

# if __name__ == '__main__':
#     clusterClubs();