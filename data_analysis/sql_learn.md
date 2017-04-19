## SQL结构化查询语言  
> ### 四种类型语句  
>> **数据定义DDL**  
>>> create、alter、drop  
disbale/enable trigger : 修改触发器的状态;  
update statistic : 更新表/视图统计信息;
truncate table : 清空表中数据;
comment : 给数据对象添加注释;
rename : 更改数据对象名称;  
>> **数据操纵语言DML**  
>>> insert、delete、select、update、merge(对数据进行合并操作)  
>> **数据控制语言DCL**  
>>> grant : 赋予用户某种控制权限  
revoke : 取消用户某种控制权限  
>> **事务控制语言TCL**  
>>> commit、rollback(恢复事务相关数据至上一次COMMIT操作之后)、savepoint(保存事务相关数据和状态用以可能的回滚操作)、  
set transaction(设置事务选项)  
>> **oracle事先定义的常用角色**  
>>> connect : 创建表、视图、序列等权限;
resource : 创建过程、触发器、表、序列等权限;  
dba : 全部系统权限;  
## 简易SQL  
> 连接： conn **username**/**password**  
解锁用户： alter user **username** account unlock identified by **password**  
描述表的结构： desc **table_name**  
日期的显示格式： 修改会话参数 alter system set nls_date_format = 'YYYY-MM-DD HH24:MI:SS'  
虚表： select user from dual  / 获取随机数：select dbms_random.random from dual  
**过滤条件：**  
>> 比较运算符: > >= < <= = <> !=  
逻辑运算符: and or not  
>>> and 运算符：FALSE > NULL > TRUE
or 运算符： TRUE > NULL > FALSE
oracle提供的比较运算符: (between and)  in like (is null)  
>> 通配符: % 任意长度（可以为0）、任意字符
_ 单个字符  
>> 转义字符 查询的字符串中包含_和%时需要转义，要使用escape声明  
```sql
>>> select * from dept_tmp where dname like 'IT\_%' escape '\';
```

>> order by 排序输出  
>>> 排序一定要放到sql语句的最后  
默认是从小到大(升序)ASC;逆序(降序)DESC  
  ```SQL
  >>> select ename,sal from emp where sal<1500 order by sal desc;
  ```
>>> ****注意排序的列可以不在查询中****
