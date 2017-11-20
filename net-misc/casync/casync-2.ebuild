# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit meson

DESCRIPTION="Content Addressable Data Synchronizer"
HOMEPAGE="https://github.com/systemd/casync"
SRC_URI="https://github.com/systemd/casync/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+fuse selinux"

DEPEND="
	>=app-arch/xz-utils-5.1.0
	app-arch/zstd
	>=dev-libs/openssl-1.0:0=
	>=net-misc/curl-7.32.0
	sys-apps/acl
	fuse? ( >=sys-fs/fuse-2.6:0= )
	selinux? ( sys-libs/libselinux )
	sys-libs/zlib
"
RDEPEND="${DEPEND}"

src_prepare() {
	default_src_prepare
	# Patch issue in v2 release where it would not build without selinux support
	eapply "${FILESDIR}/${P}-selinux.patch"
}

src_configure() {
	local emesonargs=(
		-Dfuse=$(usex fuse true false)
		-Dselinux=$(usex selinux true false)
	)
	meson_src_configure
}
