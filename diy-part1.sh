#!/bin/bash

git_clone_path() {
    local BRANCH="$1"
    local REPO="$2"
    shift 2
    local DIRS="$@"
    local TMPDIR="tmp_imm"

    git clone --depth=1 --branch "${BRANCH}" "${REPO}" "${TMPDIR}"
    for p in ${DIRS}; do
        cp -r "${TMPDIR}/${p}" "$(dirname ${p})/"
    done
    rm -rf "${TMPDIR}"
}

# ========== 替换 firewall4 nftables libnftnl iptables fullconenat-nft ==========
rm -rf package/network/config/firewall4 package/network/utils/nftables package/libs/libnftnl package/network/utils/iptables package/network/utils/fullconenat-nft
git_clone_path openwrt-25.12 https://github.com/immortalwrt/immortalwrt package/network/config/firewall4 package/network/utils/nftables package/libs/libnftnl package/network/utils/iptables package/network/utils/fullconenat-nft

# Add a feed source
echo "src-git kenzo https://github.com/kenzok8/openwrt-packages" >> feeds.conf.default
