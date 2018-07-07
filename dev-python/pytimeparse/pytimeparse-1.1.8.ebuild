# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{3,4,5,6} )
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
