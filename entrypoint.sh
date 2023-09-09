#!/bin/bash

# 设置您希望的用户和组
USER=10004

chown -R $USER /home/alist/

# 设置适当的 umask 值
umask 0022

# 使用 exec 运行命令
exec su -c "./alist server --no-prefix" $USER
