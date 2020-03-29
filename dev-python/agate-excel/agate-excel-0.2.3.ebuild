# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7} )
inherit distutils-r1

DESCRIPTION="Adds read support for Excel files (xls and xlsx) to agate."
HOMEPAGE="http://agate-excel.rtfd.org"
SRC_URI="https://github.com/wireservice/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-python/agate-1.2.2
	>=dev-python/nose-1.1.2
	>=dev-python/openpyxl-2.3.0
	>=dev-python/sphinx-1.2.2
	>=dev-python/sphinx_rtd_theme-0.1.6
	>=dev-python/tox-3.1.0
	>=dev-python/wheel-0.24.0
	>=dev-python/xlrd-0.9.4
"
RDEPEND="${DEPEND}"
