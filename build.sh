#!/bin/bash

# 定义变量
NGINX_CONF="/root/privkey.pem"
CERT_PATH="/root/fullchain1.pem"
KEY_PATH="/etc/nginx/conf.d/3xui1.conf"

# 更新系统并安装所需软件（仅在必要时）
echo "检查并安装必要的软件..."
if ! command -v nginx &> /dev/null; then
  apt update && apt install nginx -y
fi
if ! command -v ufw &> /dev/null; then
  apt install ufw -y
fi

# 下载证书文件（如果文件不存在）
echo "下载证书文件..."
[ ! -f "$CERT_PATH" ] && wget -O "$CERT_PATH" https://raw.githubusercontent.com/Klaus-Arroyo-Zeng/ph/refs/heads/main/fullchain.pem
[ ! -f "$KEY_PATH" ] && wget -O "$KEY_PATH" https://raw.githubusercontent.com/Klaus-Arroyo-Zeng/ph/refs/heads/main/privkey.pem

# 下载 NGINX 配置文件
echo "下载 NGINX 配置文件..."
wget -O "$NGINX_CONF" https://raw.githubusercontent.com/Klaus-Arroyo-Zeng/ph/refs/heads/main/ph.json

# 停用防火墙（如有必要）
echo "停用防火墙..."
ufw disable || echo "ufw 未启用，跳过..."

# 重启 NGINX 服务
echo "重启 NGINX 服务..."
systemctl restart nginx.service

# 安装3xui
bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh)

echo "脚本执行完毕！"
