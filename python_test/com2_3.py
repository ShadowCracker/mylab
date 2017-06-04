# -*- coding:utf-8 -*-
import random
def compare_function(N,S,file2_list,file3_list):
    E_list = [];    #S次N的列表
    cir_num = 0;
    while cir_num<S:#S次循环
        count = 0;  #统计相同数据数量
        file3_N = [];   #存放从文本3中随机选的N行数据
        file3_length = len(file3_list);
        random_num = range(file3_length);
        index_num = random.sample(random_num, N);
        #print index_num;#随机数
        for num in index_num:#随机取N行数据
            st = file3_list[num];
            file3_N.append(st);
        for s in file3_N:
            if s in file2_list:
                count += 1;
        E_list.append(count);
        cir_num += 1;
    print E_list;
    return E_list;
