#!/bin/bash

# 定义变量
NGINX_CONF="/etc/nginx/conf.d/3xui.conf"
CERT_PATH="/root/fullchain.pem"
KEY_PATH="/root/privkey.pem"

# 更新系统并安装所需软件（仅在必要时）
echo "Checking necessary soft..."
if ! command -v nginx &> /dev/null; then
  apt update && apt install nginx -y
fi
if ! command -v ufw &> /dev/null; then
  apt install ufw -y
fi

# 下载证书文件（如果文件不存在）
echo "Downloading certificate..."
wget -O "$CERT_PATH" https://raw.githubusercontent.com/Klaus-Arroyo-Zeng/ph/refs/heads/main/fullchain.pem
wget -O "$KEY_PATH" https://raw.githubusercontent.com/Klaus-Arroyo-Zeng/ph/refs/heads/main/privkey.pem

# 下载 NGINX 配置文件
echo "Downloading NGINX config file..."
wget -O /etc/nginx/conf.d/3xui.conf https://raw.githubusercontent.com/Klaus-Arroyo-Zeng/ph/refs/heads/main/ph.conf

# 停用防火墙（如有必要）
echo "Stopping ufw..."
ufw disable || echo "ufw inative, skip..."

# 重启 NGINX 服务
echo "Restart NGINX..."
systemctl restart nginx.service

echo "Successful！"
