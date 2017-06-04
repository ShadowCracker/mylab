#-*- coding:utf-8 -*-
def addWord(theIndex,word,pagenumber):  
    theIndex.setdefault(word, []).append(pagenumber); 
  
d = {"hello":[3]}  
#d = {}  
addWord(d,"hello",3)  
addWord(d,"hello",56)  
addWord(d,"nihao",24)  
print d 