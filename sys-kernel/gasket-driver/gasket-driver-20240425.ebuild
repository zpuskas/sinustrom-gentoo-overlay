# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-mod-r1 udev

DESCRIPTION="The Coral Gasket Driver allows usage of the Coral EdgeTPU on Linux systems"
HOMEPAGE="https://github.com/google/gasket-driver"
GASKET_COMMIT="5815ee3908a46a415aac616ac7b9aedcb98a504c"
SRC_URI="https://github.com/google/${PN}/archive/${GASKET_COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${PN}-${GASKET_COMMIT}"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	virtual/linux-sources
"

PATCHES=(
	"${FILESDIR}/${PN}-no_llseek-fix.patch"
	"${FILESDIR}/${PN}-kernel-6.13-compat.patch"
)

src_compile() {
	local modargs=( KVERSION="${KV_FULL}" )
	local modlist=( gasket=drivers/pci/pcie:"${S}/src" apex=drivers/pci/pcie:"${S}/src" )

	linux-mod-r1_src_compile
}

src_install() {
	linux-mod-r1_src_install
	insinto /lib/udev/rules.d
	newins "${S}/debian/gasket-dkms.udev" 60-gasket.rules
}

pkg_postinst() {
	linux-mod-r1_pkg_postinst
	udev_reload
}

pkg_postrm() {
	udev_reload
}
