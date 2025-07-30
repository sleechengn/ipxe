### 这个是编译官方ipxe的脚本
## 环境 ubuntu 22.04 jammy

使用方法

将 `build.sh` 赋予执行权限执行

将编译出两个文件

一个是： /opt/ipxe/src/bin-x86_64-efi/ipxe.efi

用于efi

一个是： /opt/ipxe/src/bin/undionly.kpxe

用于bios

这两个固件将自动启动 tftp://${next-server}/boot.ipxe

所以使用这两个固件，控制权交给 tftp://${next-server}/boot.ipxe，自定义内容
