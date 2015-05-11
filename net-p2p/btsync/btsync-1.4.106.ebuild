# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Automatically sync files via secure, distributed technology"
HOMEPAGE="http://labs.bittorrent.com/experiments/sync.html"
SRC_URI="x86?	( http://download.getsyncapp.com/endpoint/btsync/os/linux-i386/track/stable -> ${P}-x86.tar.gz )
	amd64?	( http://download.getsyncapp.com/endpoint/btsync/os/linux-x64/track/stable -> ${P}-x64.tar.gz )"

LICENSE="BitTorrent"
SLOT=0
KEYWORDS="~amd64 ~x86"
IUSE=""

S=${WORKDIR}

src_install() {
	dodoc LICENSE.TXT
	dobin btsync
}
