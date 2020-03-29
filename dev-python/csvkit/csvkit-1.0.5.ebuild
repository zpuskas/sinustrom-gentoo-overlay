# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7} )
DISTUTILS_USE_SETUPTOOLS=rdepend
inherit distutils-r1

DESCRIPTION="csvkit is a suite of utilities for converting to and working with CSV files."
HOMEPAGE="http://csvkit.readthedocs.org/"
SRC_URI="https://github.com/wireservice/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-python/agate-1.6.1
	>=dev-python/agate-dbf-0.2.0
	>=dev-python/agate-excel-0.2.2
	>=dev-python/agate-sql-0.5.3
	>=dev-python/six-1.6.1
"
RDEPEND="${DEPEND}"
