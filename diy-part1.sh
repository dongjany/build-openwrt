#!/bin/bash
#=================================================
#  Diy-Part1 前置定制脚本
#  适配：Lienol OpenWrt 25.12
#  执行时机：feeds update 之前
#=================================================
set -euo pipefail

echo -e "\033[32m[INFO] 开始执行前置DIY配置...\033[0m"

# 进入源码目录
cd openwrt

# ========== 可自定义区域 ==========
# 1、替换官方 feeds 为优质源（可选）
# sed -i 's|https://git.openwrt.org/feed|https://github.com/openwrt|g' feeds.conf.default

# 2、拉取常用美化/功能插件（按需开启）
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
# =================================

echo -e "\033[32m[INFO] 前置DIY配置执行完成！\033[0m"
