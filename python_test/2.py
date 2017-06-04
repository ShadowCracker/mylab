#-*- coding:utf-8 -*-
file_dir = 'C:/Users/Administrator/Desktop/Python/Python_test/in2.bed'
file_out = 'C:/Users/Administrator/Desktop/Python/in2.bed'
file_ = open(file_dir);
file_o = open(file_out, 'w+');
file_lines = file_.readlines();

for file_line in file_lines:
    file_arr = file_line.split('\t');
    len = int(file_arr[2].strip('\n')) - int(file_arr[1]);
    #print file_arr, len;
    file_line_new = file_line.strip('\n')+'\t'+str(len)+'\n';
    file_o.write(file_line_new);