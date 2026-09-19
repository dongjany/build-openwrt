#!/bin/bash
#========================================================================================================================
# https://github.com/dongjany/build-openwrt
# Description: Automatically Build OpenWrt
# Function: DIY script (Before updating feeds — modify the default IP, hostname, theme, add/remove packages, etc.)
# Source code repository: https://github.com/Lienol/openwrt / Branch: 23.05
#========================================================================================================================

# Add a custom feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# Remove unnecessary packages
# rm -rf package/utils/{ucode,fbtest}
git clone --depth 1 --branch v2.4.3 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
