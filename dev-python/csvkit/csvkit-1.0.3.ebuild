# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{3,4,5,6} )
inherit distutils-r1

DESCRIPTION="csvkit is a suite of utilities for converting to and working with CSV files."
HOMEPAGE="http://csvkit.readthedocs.org/"
SRC_URI="https://github.com/wireservice/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-python/agate-1.5.5
	>=dev-python/agate-dbf-0.2.0
	>=dev-python/agate-excel-0.2.2
	>=dev-python/agate-sql-0.5.2
	>=dev-python/six-1.6.1
"
RDEPEND="${DEPEND}"
