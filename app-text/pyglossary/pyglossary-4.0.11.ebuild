# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
DISTUTILS_USE_SETUPTOOLS=rdepend
inherit distutils-r1

DESCRIPTION="A tool for converting dictionary files aka glossaries."
HOMEPAGE="https://github.com/ilius/pyglossary"
SRC_URI="https://github.com/ilius/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gtk"

DEPEND="
	dev-python/beautifulsoup[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/PyICU[${PYTHON_USEDEP}]
	dev-libs/marisa[${PYTHON_USEDEP}]
	dev-python/prompt_toolkit[${PYTHON_USEDEP}]
	gtk? ( dev-python/pygobject[${PYTHON_USEDEP}] )
"
RDEPEND="${DEPEND}"
