# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit meson flag-o-matic

DESCRIPTION="Reference implementation for the ZIM file format"
HOMEPAGE="https://wiki.openzim.org/wiki/OpenZIM"
SRC_URI="https://github.com/openzim/$PN/archive/$PV.tar.gz -> $P.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="sys-libs/zlib
	app-arch/lzma
	dev-libs/icu
	dev-libs/xapian
	app-arch/zstd
	dev-libs/xapian
	sys-fs/e2fsprogs"

BDEPEND="virtual/pkgconfig"

src_configure() {
	append-cxxflags -std=c++17
	meson_src_configure
}
