# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7} )
DISTUTILS_USE_SETUPTOOLS=rdepend
inherit distutils-r1

DESCRIPTION="A python library to parse time from human readable string."
HOMEPAGE="https://github.com/wroberts/pytimeparse"
SRC_URI="https://github.com/wroberts/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

python_prepare_all() {
	rm -rf "${S}/${PN}/tests" || die "Removing tests failed"
	distutils-r1_python_prepare_all
}
