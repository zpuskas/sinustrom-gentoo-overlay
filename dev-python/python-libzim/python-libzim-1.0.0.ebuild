# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{7,8,9} )
inherit distutils-r1

DESCRIPTION="The Python-libzim package allows you to read/write ZIM files in Python."
HOMEPAGE="https://wiki.openzim.org/wiki/OpenZIM"
SRC_URI="https://github.com/openzim/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=app-arch/libzim-6.1.7
"
RDEPEND="${DEPEND}"
BDEPEND=""

distutils_enable_tests pytest
