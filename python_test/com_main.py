# -*- coding:utf-8 -*-
from com2_3 import compare_function 
if __name__ == '__main__':
    file1 = open("F:/yloves/test/test1.txt",'r');#txt1文本地址
    file2 = open("F:/yloves/test/test2.txt",'r');
    file3 = open("F:/yloves/test/test3.txt",'r');
    file1_list = [];
    file2_list = [];
    file3_list = [];
    for line in file1.readlines():
        file1_list.append(line.strip('\n'));
    for line in file2.readlines():
        file2_list.append(line.strip('\n'));
    for line in file3.readlines():
        file3_list.append(line.strip('\n'));
    #print file1_list;
    #print file2_list;
    #print file3_list;
    #统计文本1、2中相同数据
    count1_2 = 0;       #1、2文本中相同数目统计
    for s in file1_list:
        if s in file2_list:
            count1_2 += 1;
    print count1_2;
    #参数
    N = 1000;#随机取N行数据
    S = 10;#循环次数
    E_list = compare_function(N,S,file2_list,file3_list);
    M = 0;
    for n in E_list:
        if count1_2 <= n:
            M += 1;
    print M;