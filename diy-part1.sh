#!/bin/bash
# DIY‑PART1: feeds update 之前执行 | Lienol‑OpenWrt 25.12
set -euo pipefail

# 追加自定义feed源
# echo "src-git custom_feed https://github.com/xxx/xxx.git" >> feeds.conf.default

# 添加第三方插件
# git clone --depth 1 https://github.com/xxx/plugin.git package/xxx-plugin

# 替换原有软件包
# rm -rf package/feeds/packages/xxx-pkg
# git clone --depth 1 https://github.com/xxx/new-xxx.git package/xxx-pkg
