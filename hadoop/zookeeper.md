1、解压文件
	tar zxvf zookeeper.tar.gz -C 目录
2、配置环境变量
3、修改配置文件
	安装目录/conf/zoo_sample.cfg
	mv zoo_sample.cfg zoo.cfg
	修改目录配置：dataDir=/opt/zookeeper
	添加：
		server.1=zook1:2888:3888
		server.2=zooK2:2888:3888
		server.3=zook3:2888:3888
4、在dataDir目录下新建myid文件
5、同步到其他节点同时配置环境变量
	scp -r 安装目录 node2:目录
6、同时启动zookeeper
	zkServer.sh start 启动
	zkServer.sh status 查看状态
	当有fllower leader时正常

启动zookeeper时会在启动目录生成一个.out的日志文件
