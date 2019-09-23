# git 常用

## 密码相关

- 设置本地或服务器永久保存密码
  - `git config --global credential.helper store`
- 设置一个较短的过期时间
  - `git config --global credential.helper 'cache --timeout=5'`
- 缓存密码清除
  - `git config --system --unset credential.helper`
  - `git config --global credential.helper store`

## log相关

- git log 美化, 命令 `git lg`
  - git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

## 代码统计

```bash
git log --format='%aN' | sort -u | while read name; do echo -en "用户:$name,";git log --author="$name" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "\tlines added:%s, removed:%s, total: %s\n", add, subs, loc }' -;done
```
