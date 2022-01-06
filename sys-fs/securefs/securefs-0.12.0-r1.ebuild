# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8,9} )
inherit cmake linux-info python-any-r1

DESCRIPTION="securefs is a filesystem in userspace with transparent encryption and decryption"
HOMEPAGE="https://github.com/netheril96/securefs"
SRC_URI="https://github.com/netheril96/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=dev-libs/crypto++-8.5.0:=
	>=dev-cpp/tclap-1.2.2
	>=dev-libs/libutf8proc-2.5.0
	>=sys-fs/fuse-2.9.9:0
"
DEPEND="
	${RDEPEND}
	${PYTHON_DEPS}
"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/${P}-unbundle-libs.patch"
	"${FILESDIR}/${P}-fix-type-errors.patch"
)

pkg_setup() {
	local CONFIG_CHECK="~FUSE_FS"
	local WARNING_FUSE_FS="CONFIG_FUSE_FS is required for cryfs support."

	check_extra_config
}

src_test() {
	local TMPDIR="${T}"

	"${BUILD_DIR}"/securefs-test || die "Tests have failed"
}
