#-*- coding:utf-8 -*-
file_in_1 = 'C:/Users/Administrator/Desktop/Python/Python_test/in5.fa'
file_in_2 = 'C:/Users/Administrator/Desktop/Python/Python_test/in6.txt'
file_out = 'C:/Users/Administrator/Desktop/Python/6.fa'
file_1 = open(file_in_1)
file_2 = open(file_in_2)
file_o = open(file_out, 'w+')
def addWord(theIndex,word,pagenumber):  
    theIndex.setdefault(word, []).append(pagenumber);
d = {};
file_lines_1 = file_1.readlines();
file_lines_2 = file_2.readlines();
for file_line in file_lines_1[:-1]:
    if '>' in file_line:
        key = file_line.strip('\n');
    else:
        addWord(d, key, file_line.strip('\n'));
for f_line in file_lines_2:
    f_line = f_line.strip('\n');
    f_list = d.get(f_line);
    file_o.write(f_line+'\n')
    for s in f_list:
        file_o.write(s+'\n');
