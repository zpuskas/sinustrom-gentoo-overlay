# Copyright 2014 Zoltan Puskas 
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Sunwait is for calculating sunrise and sunset, as well as, civil, nautical, and astronomical twilights."
HOMEPAGE="http://www.risacher.org/sunwait/"
SRC_URI="http://www.risacher.org/sunwait/sunwait-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_install() {
	dodir /usr/bin
	cp -R "${S}/sunwait" "${D}/usr/bin/" || die "Install failed!"
}
