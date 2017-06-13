1、修改yum源 /etc/yum.repos.d/CentOS-Base.repo
	mirrors.aliyun.com
	yum clean all   清除缓存
	yum makecache   生成缓存
2、时间同步 ntp
	yum install ntp -y
	ntpdate -u 时间服务器地址（sla.time.edu.cn）
3、免密码登录
	ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
	cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
4、安装jdk
	rpm -ivh jdk.rpm(默认安装路径/usr/java)
5、解压hadoop
	tar -zxvf hadoop.tar.gz -C 目录
6、修改配置文件
	(1)hadoop-env.sh
	dfs.defaultFS 入口配置
	hadoop.tmp.dir 目录配置，必须为空或者不存在
	(2)hdfs-site.xml
	dfs.replication 副本数
	dfs.namenode.secondary.http-address SNN入口
	（3）masters 指定SNN的位置 手动创建
	（4）slaves 指定DN的位置
7、同步配置文件
	scp -r hadoop目录 节点：目录
8、关闭防火墙
	service iptables stop （CentOS6）
	systemctl stop firewalld.service （CentOS7）
9、启动
	hdfs namenode -format  格式化
