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

## Tools

- [goland tools](https://github.com/golang/tools)
- [goimports](https://github.com/golang/tools/tree/master/cmd/goimports)
- [golangci-lint](https://github.com/golangci/golangci-lint)
  - [golangci-lint.run](https://golangci-lint.run/)

```bash
# source install

go get -u golang.org/x/tools/cmd/goimports
go get -u github.com/golangci/golangci-lint/cmd/golangci-lint
#go get github.com/golangci/golangci-lint/cmd/golangci-lint@v1.27.0
#golangci-lint --version
```

### [golangci-lint](https://golangci-lint.run/)

```bash
# MacOS
brew install golangci/tap/golangci-lint
brew upgrade golangci/tap/golangci-lint

# Docker
docker run --rm -v $(pwd):/app -w /app golangci/golangci-lint:v1.27.0 golangci-lint run -v

# Linux and Windows

# binary will be $(go env GOPATH)/bin/golangci-lint
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.27.0

golangci-lint --version

# golangci-lint
# all linters
golangci-lint linters

golangci-lint run
# golangci-lint run --enable-all
# golangci-lint --disable-all -E errcheck
```
