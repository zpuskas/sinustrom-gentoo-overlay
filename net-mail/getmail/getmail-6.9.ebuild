# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8,9} )

PYTHON_REQ_USE="ssl"

DISTUTILS_USE_SETUPTOOLS=bdepend
inherit distutils-r1

DESCRIPTION="A mail retriever with reliable Maildir and mbox delivery"
HOMEPAGE="http://www.getmail6.org/"
SRC_URI="https://github.com/getmail6/getmail6/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/getmail6-${PV}"

python_prepare_all() {
	sed -i -e "s,'getmail-%s' % __version__,'${PF}'," -e "/docs\/COPYING/d" "${S}"/setup.py || die
	distutils-r1_python_prepare_all
}
