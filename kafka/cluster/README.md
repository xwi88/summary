# 集群配置说明

## 下载

[kafka downloads](https://kafka.apache.org/downloads)

```bash
wget https://www.apache.org/dyn/closer.cgi?path=/kafka/2.5.0/kafka_2.13-2.5.0.tgz
```

## 创建应用目录

mkdir /usr/kafka

## 创建Kafka数据目录

mkdir -p /home/superuser/data/kafka
mkdir -p /home/superuser/data/kafka/logs
chmod 777 -R /home/superuser/data/kafka

## 解压

tar -zvxf kafka_2.13-2.5.0.tgz -C /usr/kafka

## 配置

```bash
broker.id=0
listeners=PLAINTEXT://10.14.41.57:9092
log.dirs=/home/superuser/data/kafka/logs
num.partitions=3
offsets.topic.replication.factor=2
transaction.state.log.replication.factor=2
transaction.state.log.min.isr=2
zookeeper.connect=10.14.41.57:2181,10.14.41.58:2181,10.14.41.59:2181
```

## 防火墙配置

```bash
#开放端口
firewall-cmd --add-port=9092/tcp --permanent

#重新加载防火墙配置
firewall-cmd --reload
```

## 启动Kafka

```bash
#进入kafka根目录
cd /usr/kafka/kafka_2.13-2.5.0/

#启动
/bin/kafka-server-start.sh config/server.properties &
```

## 创建Topic

```bash
bin/kafka-topics.sh --create --bootstrap-server 10.14.41.57:9092 --replication-factor 2 --partitions 3 --topic test-topic
```

## 查看Topic

```bash
bin/kafka-topics.sh --list --bootstrap-server 10.14.41.57:9092
```
