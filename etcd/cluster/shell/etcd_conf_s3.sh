#!/usr/bin/env bash

# make sure etcd process has write access to this directory
# bin shall be /usr/local/bin
# etcd && etcdctl
ETCD_HTTP_SCHEME=http
#must start with prefix: http:// or https://
ETCD_HTTP_SCHEME_PART=${ETCD_HTTP_SCHEME}://

ETCD_CLUSTER_TOKEN=etcd_bj_dev_20200426

ETCD_NODE_NAME=s3
#CURRENT_HOST_CLIENT=${ETCD_HTTP_SCHEME_PART}localhost:2379
#CURRENT_HOST_PEER=${ETCD_HTTP_SCHEME_PART}localhost:2380
CURRENT_HOST_CLIENT=${ETCD_HTTP_SCHEME_PART}10.14.41.53:2379
CURRENT_HOST_PEER=${ETCD_HTTP_SCHEME_PART}10.14.41.53:2380

#cluster peer nodes
CLUSTER_PEER_S1="s1=${ETCD_HTTP_SCHEME_PART}10.14.41.51:2380"
CLUSTER_PEER_S2="s2=${ETCD_HTTP_SCHEME_PART}10.14.41.52:2380"
CLUSTER_PEER_S3="s3=${ETCD_HTTP_SCHEME_PART}10.14.41.53:2380"

INITIAL_CLUSTER="${CLUSTER_PEER_S1},${CLUSTER_PEER_S2},${CLUSTER_PEER_S3}"

ETCD_PATH_BIN=/usr/local/bin/etcd
ETCD_PATH_DATA=/data/etcd

LISTEN_CLIENT_URLS=${CURRENT_HOST_CLIENT}
ADVERTISE_CLIENT_URLS=${CURRENT_HOST_CLIENT}
LISTEN_PEER_URLS=${CURRENT_HOST_PEER}

mkdir -p ${ETCD_PATH_DATA}

${ETCD_PATH_BIN} --name ${ETCD_NODE_NAME} \
  --data-dir ${ETCD_PATH_DATA}/${ETCD_NODE_NAME} \
  --wal-dir=${wal_dir}
  --listen-client-urls ${LISTEN_CLIENT_URLS} \
  --advertise-client-urls ${ADVERTISE_CLIENT_URLS} \
  --listen-peer-urls ${LISTEN_PEER_URLS} \
  --initial-advertise-peer-urls ${LISTEN_PEER_URLS} \
  --initial-cluster ${INITIAL_CLUSTER} \
  --initial-cluster-token ${ETCD_CLUSTER_TOKEN} \
  --initial-cluster-state new \
  --quota-backend-bytes $((4*1024*1024*1024)) \
  -–snapshot-count 100000 \
  –-heartbeat-interval 100 \
  -–election-timeout 1000 \
  –-max-snapshots 5 \
  -–max-wals 5 \
  –-max-txn-ops 128 \
  –-max-request-bytes $((1.5*1024*1024)) \
  –-grpc-keepalive-min-time 5s \
  –-grpc-keepalive-interval 2h \
  –-grpc-keepalive-timeout 20s \
  -–auto-compaction-retention 0 \
  --auto-compaction-mode periodic \
  –-metrics extensive \
  -–cors "" \
  --enable-pprof \
  --debug
  