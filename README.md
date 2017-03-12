docker

```
 docker run  --net=host  -e "ETCD_DATA_DIR=/var/lib/etcd2"  -e "ETCD_ADVERTISE_CLIENT_URLS=http://192.168.1.145:2379" -e "ETCD_INITIAL_ADVERTISE_PEER_URLS=http://192.168.1.145:2380" -e "ETCD_INITIAL_CLUSTER=infra0=http://192.168.1.145:2380,infra1=http://192.168.1.146:2380,infra2=http://192.168.1.147:2380" -e "ETCD_INITIAL_CLUSTER_STATE=new" -e "ETCD_INITIAL_CLUSTER_TOKEN=etcd-cluster-1" -e "ETCD_LISTEN_CLIENT_URLS=http://192.168.1.145:2379,http://127.0.0.1:2379" -e "ETCD_LISTEN_PEER_URLS=http://192.168.1.145:2380" -e "ETCD_NAME=infra0"  -v /var/lib/etcd2:/var/lib/etcd2:rw lukaszbielinski/docker-etcd:latest 
```
