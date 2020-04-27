# Start the Etcd Cluster

>start each node with each config file

- `etcd --config-file ./etcd_conf_s1.yml`
- `etcd --config-file ./etcd_conf_s2.yml`
- `etcd --config-file ./etcd_conf_s3.yml`

## dameon run

- `nohup etcd --config-file ./etcd_conf_s1.yml >/dev/null 2>&1 &`
- `nohup etcd --config-file ./etcd_conf_s2.yml >/dev/null 2>&1 &`
- `nohup etcd --config-file ./etcd_conf_s3.yml >/dev/null 2>&1 &`

## cluster view

- cluster member: `etcdctl --endpoints 10.14.41.51:2379 member list -w table`
