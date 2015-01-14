# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit pam eutils

DESCRIPTION="Toolkit for using one-time password authentication with HOTP/TOTP algorithms"
HOMEPAGE="http://www.nongnu.org/oath-toolkit/"
SRC_URI="http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz"
LICENSE="GPL-3 LGPL-2.1"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="pam pskc"

DEPEND="pam? ( virtual/pam )"
DEPEND="pskc? ( dev-libs/xmlsec )"
RDEPEND="${DEPEND}"

src_configure() {
	econf $(use_enable pam) $(use_enable pskc) --with-pam-dir=$(getpam_mod_dir)
}

src_install() {
	default
	if use pam; then
		newdoc pam_oath/README README.pam
	fi
	if use pskc; then
		doman pskctool/pskctool.1
	fi
}
