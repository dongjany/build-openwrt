# 下载 nftables fullcone 补丁
wget -P package/network/utils/nftables/patches https://raw.githubusercontent.com/coolsnowwolf/lede/master/package/network/utils/nftables/patches/100-nftables-add-fullcone-expression-support.patch

# 下载 libnftnl fullcone 配套补丁
wget -P package/libs/libnftnl/patches https://raw.githubusercontent.com/coolsnowwolf/lede/master/package/libs/libnftnl/patches/001-libnftnl-add-fullcone-expression-support.patch

# Add a feed source
echo "src-git kenzo https://github.com/kenzok8/openwrt-packages" >> feeds.conf.default
