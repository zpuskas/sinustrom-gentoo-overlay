# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

SRC_URI="https://github.com/risacher/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

DESCRIPTION="Sunwait is for calculating sunrise and sunset, and different twilights."
HOMEPAGE="http://www.risacher.org/sunwait/"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~amd64 ~x86"

PATCHES=(
	"${FILESDIR}/${PN}-makefile.patch"
)

src_install() {
	dodir /usr/bin
	cp -R "${S}/sunwait" "${D}/usr/bin/" || die "Install failed!"
	dodoc USAGE.txt
}
