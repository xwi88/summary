# Golang

## 开发环境配置

`vi ~/.bashrc` or `vi ~/.zshrc`

```bash
GOPROXY=https://mirrors.aliyun.com/goproxy,https://goproxy.cn,https://goproxy.io,https://gocenter.io,https://proxy.golang.org,direct

GONOPROXY=*.corp.example.com
GONOSUMDB=*.corp.example.com
GOPRIVATE=*.corp.example.com,git.example.com
#GONOSUMDB=sum.golang.org
```
