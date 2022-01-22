# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="reddio is a command-line interface for Reddit written in POSIX sh"
HOMEPAGE="https://gitlab.com/aaronNG/reddio"
SRC_URI="https://gitlab.com/aaronNG/${PN}/-/archive/v${PV}/${PN}-v${PV}.tar.bz2 -> ${P}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="
	${DEPEND}
	app-misc/jq
	net-analyzer/netcat
	net-misc/curl
	sys-apps/coreutils
"
BDEPEND=""

S="${WORKDIR}/${PN}-v${PV}"

src_prepare() {
	eapply "${FILESDIR}/${P}-date.patch"
	eapply_user
	sed -i -e 's/"DOC_FOLDER="/"DOC_FOLDER?="/' Makefile || die "Sed failed!"
	sed -i -e 's|/usr/local/|/usr/|' reddio || die "Sed failed!"
}

src_compile() { :; }

src_install() {
	emake PREFIX="${ED}/usr" DOC_FOLDER="${ED}/usr/share/doc/${P}" install
}
