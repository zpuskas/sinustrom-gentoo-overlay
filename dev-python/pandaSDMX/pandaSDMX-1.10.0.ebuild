# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{10..11} )

inherit distutils-r1 pypi

DESCRIPTION="Statistical Data and Metadata eXchange library"
HOMEPAGE="https://github.com/dr-leo/pandasdmx"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/requests-2.26[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.8[${PYTHON_USEDEP}]
	>=dev-python/pandas-1.3[${PYTHON_USEDEP}]
	>=dev-python/requests-cache-0.9.5[${PYTHON_USEDEP}]
	>=dev-python/appdirs-1.4[${PYTHON_USEDEP}]
	<dev-python/pydantic-2.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		>=dev-python/pytest-5.0[${PYTHON_USEDEP}]
		>=dev-python/requests-mock-1.4[${PYTHON_USEDEP}]
	)
	doc? (
		>=dev-python/sphinx-5.2[${PYTHON_USEDEP}]
		>=dev-python/ipython-7.2[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
