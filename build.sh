#!/bin/sh

# 下载nginx
apt update && apt install nginx ufw -y

# 下载 fullchain.pem 文件
wget -O /root/fullchain1.pem https://raw.githubusercontent.com/Klaus-Arroyo-Zeng/ph/refs/heads/main/fullchain.pem

# 下载 privkey.pem 文件
wget -O /root/privkey1.pem https://raw.githubusercontent.com/Klaus-Arroyo-Zeng/ph/refs/heads/main/privkey.pem

# 下载 sh 文件
wget -O /root/3xui1.conf https://raw.githubusercontent.com/Klaus-Arroyo-Zeng/ph/refs/heads/main/ph.json

ufw disable
systemctl restart nginx
