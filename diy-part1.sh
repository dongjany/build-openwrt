rm -rf package/network/config/firewall4
rm -rf package/network/utils/nftables
rm -rf package/libs/libnftnl
rm -rf package/network/utils/iptables

# svn 拉取github指定目录
svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-25.12/package/network/config/firewall4 package/network/config/firewall4
svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-25.12/package/network/utils/nftables package/network/utils/nftables
svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-25.12/package/libs/libnftnl package/libs/libnftnl
svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-25.12/package/network/utils/iptables package/network/utils/iptables

# 修复 fullconenat-nft 报错
sed -i 's/PKG_RELEASE:=$(AUTORELEASE)/PKG_RELEASE:=3/g' package/network/utils/fullconenat-nft/Makefile

# Add a feed source
echo "src-git kenzo https://github.com/kenzok8/openwrt-packages" >> feeds.conf.default
