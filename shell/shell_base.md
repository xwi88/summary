# 常用脚本

## 连接数查看

```bash
netstat -n| awk '/^tcp/ {++S[$NF]} END {for(a in S) print a, S[a]}'
```

每隔一秒统计一次: [netstat_interval.sh](netstat_interval.sh)
