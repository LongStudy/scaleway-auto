# scaleway-auto
首先下载星尘cil并初始化
``` bash
# 安装星尘cil
wget https://github.com/scaleway/scaleway-cli/releases/download/v2.4.0/scw-2.4.0-linux-x86_64
mv scw-2.4.0-linux-x86_64 /bin/scw
chmod +x /bin/scw
```
然后登录账号
``` bash
# 登录账号，获取账号UUID
scw init
# 创建服务器，需要账号UUID
scw instance server create type=STARDUST1-S zone=fr-par-1 image=debian_bullseye root-volume=l:10G name=Denian ip=none ipv6=true project-id=你的账号UUID
# 查看服务器，获取机器的UUID
scw instance server list
# 开机，需要机器UUID
scw instance server start 你的机器UUID
```
需要等待一段时间，然后再查看服务器状态，一般资源不够都会开机失败
``` bash
# 编写shell脚本，每隔一段时间开机，直到开机成功
# 创建文件
vim scw.sh
# 填入你的机器UUID
# 给予脚本执行权限
chmod +x scw.sh
# 需要安装screen，创建一个Screen会话
screen -S scw
# 在Screen会话中执行脚本
./scw.sh
```

可以参考 [https://qiedd.com/1207.html](https://qiedd.com/1207.html) 给机器设置密码
