#!/bin/bash
# DIY‑PART2: feeds install之后编译前 | Lienol‑OpenWrt 25.12
set -euo pipefail

# 修改主机名，取消注释启用
# NEW_HOSTNAME="Lienol‑Wrt"
# sed -i "s/OpenWrt/${NEW_HOSTNAME}/g" package/base-files/files/etc/hostname
# sed -i "s/option hostname 'OpenWrt'/option hostname '${NEW_HOSTNAME}'/g" package/base-files/files/etc/config/system

# 修改LAN网关IP，取消注释启用
# LAN_IP="192.168.1.1"
# sed -i "s/192.168.1.1/${LAN_IP}/g" package/base-files/files/etc/config/network

# 设置默认luci‑argon主题（主题源码需要part1拉取）
LUCI_THEME="argon"
mkdir -p package/base-files/files/etc/uci-defaults
cat > package/base-files/files/etc/uci-defaults/99-set-luci-theme <<EOF
#!/bin/sh
uci set luci.main.mediaurlbase='/luci-static/${LUCI_THEME}'
uci commit luci
EOF
chmod +x package/base-files/files/etc/uci-defaults/99-set-luci-theme
