# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-mod linux-info eutils

DESCRIPTION="MaxLinear (Exar) XR series UART to USB kernel drivers"
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

pkg_setup() {
	if kernel_is -lt 3 6; then
		ewarn "This module only works with kernel versions >=3.6.X"
		die
	fi
	linux-mod_pkg_setup
	BUILD_PARAMS="KERNELDIR=${KV_DIR}"
}

src_install() {
	linux-mod_src_install
	dodoc README.txt
}
