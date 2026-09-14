rm -rf package/network/config/firewall4 package/network/utils/nftables package/libs/libnftnl

# 拉 immortalwrt
git clone --depth=1 --branch openwrt-25.12 --filter=blob:none --sparse https://github.com/immortalwrt/immortalwrt tmp_imm
cd tmp_imm
git sparse-checkout set package/network/config/firewall4 package/network/utils/nftables package/libs/libnftnl
cd ..
cp -r tmp_imm/package/network/config/firewall4 package/network/config/
cp -r tmp_imm/package/network/utils/nftables package/network/utils/
cp -r tmp_imm/package/libs/libnftnl package/libs/
rm -rf tmp_imm

# 修复 fullconenat-nft 报错
sed -i 's/PKG_RELEASE:=$(AUTORELEASE)/PKG_RELEASE:=3/g' package/network/utils/fullconenat-nft/Makefile

# Add a feed source
echo "src-git kenzo https://github.com/kenzok8/openwrt-packages" >> feeds.conf.default
