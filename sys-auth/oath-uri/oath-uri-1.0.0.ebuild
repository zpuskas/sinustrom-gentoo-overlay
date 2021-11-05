# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="A C/C++ library, and CLI tool to generate OATH TOTP/HOTP key sharing URIs"
HOMEPAGE="https://sinustrom.info/projects/oath-uri/"
SRC_URI="https://github.com/zpuskas/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2+ GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+cli"

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DLIB_INSTALL_DIR="$(get_libdir)"
		-DOATHURI_CLI="$(usex cli)"
	)
	cmake_src_configure
}
