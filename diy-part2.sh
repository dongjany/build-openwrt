#!/bin/bash
#=================================================
# DIY‑PART2 后置脚本 (feeds install之后，编译前)
# 设置：默认LAN‑IP、时区、主机名、LuCI默认主题、登录banner
# 适配 Lienol‑OpenWrt 25.12
#=================================================
set -euo pipefail

echo -e "\033[34m[DIY‑PART2] ========== 开始后置系统定制 ==========\033[0m"

cd openwrt

# ---------- 导入本地.config配置并生效 ----------
cp -f ../.config .config
make defconfig

# ---------- 1. 修改主机名 ----------
# NEW_HOSTNAME="Lienol‑Wrt"
# sed -i "s/OpenWrt/${NEW_HOSTNAME}/g" package/base-files/files/etc/hostname
# sed -i "s/option hostname 'OpenWrt'/option hostname '${NEW_HOSTNAME}'/g" package/base-files/files/etc/config/system

# ---------- 2. 设置时区为东八区 ----------
sed -i "s/'UTC'/'CST‑8'/g" package/base-files/files/etc/config/system
sed -i "s/UTC/CST‑8/g" package/base-files/files/TZ

# ---------- 3. 修改LAN默认IP地址（内网网关） ----------
# 默认：192.168.1.1；如需修改，直接修改下面IP变量
# LAN_IP="192.168.1.1"
# sed -i "s/192.168.1.1/${LAN_IP}/g" package/base-files/files/etc/config/network

# ---------- 4. 设置LuCI默认主题（argon；仅写入配置，主题包需要自行在diy‑part1.sh添加） ----------
# 如果使用官方bootstrap主题，把argon改为bootstrap
LUCI_THEME="argon"
# 写入uci默认主题配置
mkdir -p package/base-files/files/etc/uci-defaults
cat > package/base-files/files/etc/uci-defaults/99-set-luci-theme << EOF
#!/bin/sh
uci set luci.main.mediaurlbase='/luci-static/${LUCI_THEME}'
uci commit luci
EOF
chmod +x package/base-files/files/etc/uci-defaults/99-set-luci-theme

# ---------- 5. SSH登录Banner 开机标语 ----------
cat > package/base-files/files/etc/banner << EOF
=============================================
      Lienol‑OpenWrt 25.12 Custom Build
      Build: $(date +%Y‑%m‑%d)
=============================================
EOF

echo -e "\033[34m[DIY‑PART2] ========== diy‑part2 执行结束 ==========\033[0m"
