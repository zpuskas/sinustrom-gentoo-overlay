# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9,10} )
inherit distutils-r1

DESCRIPTION="Python module which implements DokuWiki's XML-RPC interface"
HOMEPAGE="https://github.com/kynan/dokuwikixmlrpc"
SRC_URI="https://github.com/kynan/dokuwikixmlrpc/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
