# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils vcs-snapshot

DESCRIPTION="NCurses based audio file tag (metadata) editor"
HOMEPAGE="https://github.com/lotuskip/cursetag"
SRC_REVISION="8573897dfd353354443179a8dfb3e5baa98bf03b"
SRC_URI="https://github.com/lotuskip/${PN}/tarball/${SRC_REVISION} -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	media-libs/taglib
	sys-libs/ncurses
"
RDEPEND="${DEPEND}"

src_install() {
	dodir /usr/bin
	cp "${S}/${PN}" "${D}/usr/bin/" || die "Install failed!"
	doman *.1
}
