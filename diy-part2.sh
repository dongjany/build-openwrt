#!/bin/bash
#========================================================================================================================
# https://github.com/dongjany/build-openwrt
# Description: Automatically Build OpenWrt
# Function: DIY script (Before updating feeds — modify the default IP, hostname, theme, add/remove packages, etc.)
# Source code repository: https://github.com/Lienol/openwrt / Branch: 23.05
#========================================================================================================================

# Modify default IP
#sed -i 's/192.168.1.1/192.168.5.55/g' package/base-files/files/bin/config_generate

# Modify default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/iStoreOS/g' package/base-files/files/bin/config_generate
