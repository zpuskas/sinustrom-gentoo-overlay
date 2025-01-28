# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools flag-o-matic vcs-snapshot

DESCRIPTION="A curses-based terminal BOINC client manager"
HOMEPAGE="https://github.com/suleman1971/boinctui"
SRC_URI="https://github.com/suleman1971/${PN}/archive/992d6a4de7b5cfcb118c305c55eb523030371428.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug gnutls"

DEPEND="
	dev-libs/expat
	sys-libs/ncurses:=
	gnutls? ( net-libs/gnutls:=[openssl] )
	!gnutls? ( dev-libs/openssl:= )
"
RDEPEND="${DEPEND}"
BDEPEND="
	${RDEPEND}
	dev-build/autoconf
"

PATCHES=( "${FILESDIR}"/${PN}-2.7.1-tinfo.patch )

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	local myeconfargs=(
		--with-boinc-dir="${EPREFIX}/var/lib/boinc"

		# $(use_with ...) is broken here
		$(usex !gnutls "--without-gnutls" "")
	)
	econf "${myeconfargs[@]}"

	use debug && append-cppflags -DDEBUG
}

src_install() {
	emake DESTDIR="${D}" DOCDIR="${EPREFIX}/usr/share/doc/${PF}" install
}
