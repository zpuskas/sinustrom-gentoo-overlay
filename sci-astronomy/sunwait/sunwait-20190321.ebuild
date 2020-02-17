# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

COMMIT_HASH="7326b53e5406c7ebd552ae6dc0fc659252a18e7f"
SRC_URI="http://www.risacher.org/sunwait/sunwait-${PV}.tar.gz"
SRC_URI="https://github.com/risacher/sunwait/archive/${COMMIT_HASH}.tar.gz -> ${P}.tar.gz"

DESCRIPTION="Sunwait is for calculating sunrise and sunset, and different twilights."
HOMEPAGE="http://www.risacher.org/sunwait/"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~amd64 ~x86"

PATCHES=(
	"${FILESDIR}"/"ldflags.patch"
)

src_install() {
	dodir /usr/bin
	cp -R "${S}/sunwait" "${D}/usr/bin/" || die "Install failed!"
	dodoc USAGE.txt
}
