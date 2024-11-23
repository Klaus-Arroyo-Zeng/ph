#!/bin/sh

# 下载 fullchain.pem 文件
wget -O /root/fullchain.pem https://raw.githubusercontent.com/Klaus-Arroyo-Zeng/ph/refs/heads/main/fullchain.pem

# 下载 privkey.pem 文件
wget -O /root/privkey.pem https://raw.githubusercontent.com/Klaus-Arroyo-Zeng/ph/refs/heads/main/privkey.pem

# 下载 sh 文件
wget -O /root/3xui.conf https://raw.githubusercontent.com/Klaus-Arroyo-Zeng/ph/refs/heads/main/ph.json
