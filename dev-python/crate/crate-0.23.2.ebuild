# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )
DISTUTILS_USE_SETUPTOOLS=rdepend
inherit distutils-r1

DESCRIPTION="A Python client library for CrateDB."
HOMEPAGE="https://github.com/crate/crate-python"
SRC_URI="https://github.com/crate/${PN}-python/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-python/urllib3-1.9
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-python-${PV}"

python_prepare_all() {
	# Remove tests
	rm -rf "${S}/src/${PN}/testing" || die "Removing tests failed"
	rm -rf "${S}/src/${PN}/client/sqlalchemy/tests" || die "Removing tests failed"
	find "${S}/src/${PN}/client" -name 'test*' -delete || die "Removing tests failed"
	rm "${S}/src/${PN}/client/invalid_ca.pem" || die "Removing tests failed"
	distutils-r1_python_prepare_all
}

python_install() {
	distutils-r1_python_install
	# Remove pth files, as namespace should be handled automatically
	find "${ED}" -name '*.pth' -delete || die "Deleting .pth files failed"
}
