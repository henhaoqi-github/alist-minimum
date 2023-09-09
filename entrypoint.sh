#!/bin/bash

# 设置您希望的用户和组
USER=10004

chown -R $USER /var/tmp/alist/

# 设置适当的 umask 值
umask 0022

exec $USER ./alist server --no-prefix
