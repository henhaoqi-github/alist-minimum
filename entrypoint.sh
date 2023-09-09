#!/bin/bash

# 设置您希望的用户和组
USER=myappuser
GROUP=10001

chown -R $USER:$GROUP /myapp/alist/

# 设置适当的 umask 值
umask 0022

# 运行命令
./alist server --no-prefix
