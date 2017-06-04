#-*- coding:utf-8 -*-
file_in_1 = 'C:/Users/Administrator/Desktop/Python/Python_test/in8.r1.fq'
file_in_2 = 'C:/Users/Administrator/Desktop/Python/Python_test/in8.r2.fq'
file_in_3 = 'C:/Users/Administrator/Desktop/Python/Python_test/in8.txt'
file_out = 'C:/Users/Administrator/Desktop/Python/8.txt'
file_1 = open(file_in_1)
file_2 = open(file_in_2)
file_3 = open(file_in_3)
file_o = open(file_out, 'w+')
def addWord(theIndex,word,pagenumber):  
    theIndex.setdefault(word, []).append(pagenumber);
d = {};
file_lines_1 = file_1.readlines();
file_lines_2 = file_2.readlines();
file_lines_3 = file_3.readlines();
for file_line in file_lines_1[:-1]:
    if '@' in file_line:
        key = file_line.split(' ')[0];
    else:
        addWord(d, key, file_line.strip('\n'));
for file_line in file_lines_2[:-1]:
    if '@' in file_line:
        key = file_line.split(' ')[0];
    else:
        addWord(d, key, file_line.strip('\n'));
for f_line in file_lines_3[:-1]:
    for k in d:
        if f_line.strip('\n') in k:
            f_list = d.get(k);
            file_o.write(k+'\n')
            for s in f_list:
                file_o.write(s+'\n');
            
        