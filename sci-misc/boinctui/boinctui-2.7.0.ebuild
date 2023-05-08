# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools vcs-snapshot

DESCRIPTION="A curses-based terminal BOINC client manager"
HOMEPAGE="https://github.com/suleman1971/boinctui"
SRC_URI="https://github.com/suleman1971/${PN}/archive/bb72f385ace769313bce409a869d5c5e896bb6d0.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/openssl
	dev-libs/expat
	sys-libs/ncurses
"
RDEPEND="${DEPEND}"
BDEPEND="
	${RDEPEND}
	sys-devel/autoconf
"

src_configure() {
	eautoconf
	econf
	# add missing -ltinfow to linker options
	sed -i -e 's/^\(LIBS\s*=.*\)/\1 -ltinfow/' Makefile
}
