# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-mod linux-info

DESCRIPTION="MaxLinear (Exar) XR21 series UART to USB kernel drivers"
HOMEPAGE="https://www.maxlinear.com/products/interface/uarts/usb-uarts"
SRC_URI="https://www.maxlinear.com/content/document.ashx?id=21651 -> ${P}.zip"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	app-arch/unzip
"

S="${WORKDIR}/xr_usb_serial_common_lnx-3.6-and-newer-pak"
MODULE_NAMES="xr_usb_serial_common(misc:${S})"
BUILD_TARGETS="clean all"

PATCHES=(
	"${FILESDIR}/tty-api.patch"
)

pkg_setup() {
	if kernel_is -lt 4 0; then
		ewarn "This module only works with kernel versions >=4.0"
		die
	fi
	linux-mod_pkg_setup
	BUILD_PARAMS="KERNELDIR=${KV_DIR}"
}

src_install() {
	linux-mod_src_install
	dodoc README.txt
}
