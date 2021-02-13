# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=7

inherit meson

DESCRIPTION="Reference implementation for the ZIM file format"
HOMEPAGE="https://wiki.openzim.org/wiki/OpenZIM"
SRC_URI="https://github.com/openzim/$PN/archive/$PV.tar.gz -> $P.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="sys-libs/zlib
	app-arch/lzma
	dev-libs/icu
	app-arch/zstd
	dev-libs/xapian
	sys-fs/e2fsprogs"

DEPEND="dev-util/pkgconfig"
