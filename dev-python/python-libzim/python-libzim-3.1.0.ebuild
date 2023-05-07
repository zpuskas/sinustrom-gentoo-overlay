# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1
PYTHON_COMPAT=( python3_{10..11} )
inherit distutils-r1

DESCRIPTION="The Python-libzim package allows you to read/write ZIM files in Python."
HOMEPAGE="https://wiki.openzim.org/wiki/OpenZIM"
SRC_URI="https://github.com/openzim/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=app-arch/libzim-8.1.1
"
RDEPEND="${DEPEND}"
BDEPEND="${RDEPEND}"

distutils_enable_tests pytest

python_compile() {
	local -x USE_SYSTEM_LIBZIM=1
	distutils-r1_python_compile
}

python_install() {
	local -x USE_SYSTEM_LIBZIM=1
	distutils-r1_python_install
}
