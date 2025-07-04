# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit webapp

WEBAPP_MANUAL_SLOT="yes"
MY_PN="${PN/-/_}"

DESCRIPTION="Admin console for Beanstalk queue server, written in PHP"
HOMEPAGE="https://github.com/ptrofimov/beanstalk_console"
SRC_URI="https://github.com/ptrofimov/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="MIT"
SLOT=0
KEYWORDS="~amd64 ~x86"
IUSE="vhosts"

DEPEND="${WEBAPP_DEPEND}"
RDEPEND="
	>=dev-lang/php-8.0
	virtual/httpd-php:*
	${DEPEND}
"

need_httpd_cgi

src_install() {
	webapp_src_preinst

	insinto "${MY_HTDOCSDIR}"
	doins -r lib public src config.php storage.json

	dodoc README.md

	webapp_configfile "${MY_HTDOCSDIR}"/config.php
	webapp_configfile "${MY_HTDOCSDIR}"/storage.json
	webapp_serverowned "${MY_HTDOCSDIR}"/storage.json

	webapp_src_install
}
