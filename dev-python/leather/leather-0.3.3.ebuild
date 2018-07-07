# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{3,4,5,6} )
inherit distutils-r1

DESCRIPTION="Python charting for 80% of humans."
HOMEPAGE="http://leather.rtfd.io"
SRC_URI="https://github.com/wireservice/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-python/coverage-3.7.1
	>=dev-python/cssselect-0.9.1
	>=dev-python/lxml-3.6.0
	>=dev-python/nose-1.3.7
	>=dev-python/six-1.10.0
	>=dev-python/sphinx-1.2.2
	>=dev-python/sphinx_rtd_theme-0.1.9
	>=dev-python/tox-1.3
	>=dev-python/wheel-0.24.0
"
RDEPEND="${DEPEND}"
