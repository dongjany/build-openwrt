#!/bin/bash
#=================================================
# DIY‑PART1 前置脚本（feeds update之前执行）
# 功能：1.软件源设置  2.添加第三方软件包  3.替换原有软件包
# 适配 Lienol‑OpenWrt 25.12
# 说明：所有自定义操作全部注释，后续由使用者自行设置
#=================================================
set -euo pipefail

echo -e "\033[34m[DIY-PART1] ========== 开始前置定制 ==========\033[0m"

cd openwrt

##############################################################################
## 【1、软件源设置：修改 feeds.conf.default】
## 备份原始配置；可修改镜像、注释/追加feed源，自行按需开启
##############################################################################
echo -e "\033[32m[DIY‑PART1] 处理 feeds.conf.default 软件源\033[0m"

cp feeds.conf.default feeds.conf.default.bak

# 将官方git源替换为github镜像（国内加速，需要则取消注释）
# sed -i 's|git.openwrt.org/openwrt|github.com/openwrt|g' feeds.conf.default

# 禁用某个内置feed示例（自行修改）
# sed -i '/src-git packages/d' feeds.conf.default
# echo "#src-git packages https://github.com/openwrt/packages.git" >> feeds.conf.default

# 追加自定义feed源示例（自行填写仓库地址）
# echo "src-git custom_feed https://github.com/xxx/xxx.git" >> feeds.conf.default

##############################################################################
## 【2、添加第三方软件包：新增插件到package目录】
## 自行取消注释，填写仓库地址与目标目录
##############################################################################
echo -e "\033[32m[DIY‑PART1] 第三方软件包添加区域（待自行配置）\033[0m"

# git clone --depth 1 https://github.com/xxx/plugin.git package/xxx-plugin

##############################################################################
## 【3、软件包替换：先删除源码原有包，再拉取新版覆盖】
## feeds内软件包路径：package/feeds/<feed名称>/<包名>
##############################################################################
echo -e "\033[32m[DIY‑PART1] 软件包替换区域（待自行配置）\033[0m"

# rm -rf package/feeds/packages/xxx-pkg
# git clone --depth 1 https://github.com/xxx/new-xxx.git package/xxx-pkg

##############################################################################

echo -e "\033[34m[DIY‑PART1] ========== diy‑part1 执行结束 ==========\033[0m"
