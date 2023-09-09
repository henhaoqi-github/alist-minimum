#!/bin/bash

chown -R /home/alist/

# 设置适当的 umask 值
umask 0022

exec ./alist server --no-prefix
