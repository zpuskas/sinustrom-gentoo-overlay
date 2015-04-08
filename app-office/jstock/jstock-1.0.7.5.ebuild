# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils versionator

MY_PV=$(replace_all_version_separators '-')

DESCRIPTION="Jstock free stock market software"
HOMEPAGE="http://jstock.org/"
SRC_URI="https://github.com/yccheok/${PN}/releases/download/release_${MY_PV}/${PN}-${PV}-bin.zip"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

QA_PREBUILT="*"

DEPEND="virtual/jdk:1.7
		app-arch/unzip"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${PN}-${PV}-bin.zip
	mv ${WORKDIR}/${PN} ${WORKDIR}/${PN}-${PV}
}

src_install() {
    # Install to /opt as binary jstock needs its libaries and cannot take them from custom path 
	local installdir="/opt/jstock"

	insinto ${installdir}
	doins -r .

	# execute the shell script to launch jstock as it sets up the java environment
	fperms 0755 ${installdir}/jstock.sh

	# Make desktop entry for easier launching
	newicon ${FILESDIR}/${PN}.png ${PN}-icon128.png
	make_desktop_entry "${ROOT}/opt/jstock/jstock.sh" "jstock free stock market software" ${PN}-icon128 "Office"
}

pkg_postinst() {
	elog "This is a binary package as jstock requires Netbeans and Oracle Java 8 to build"
	elog "cleanly out of the box. Currently building with ant and other Java versions"
	elog "does not work. Built the package using Netbeans, Icedtea 7.2.5.4 and separately"
	elog "downloaded JavaFX jar and compared binaries. The result corresponds (a.k.a is"
	elog "binary equivalent) to the one downloaded from the site, thus this bin package is"
	elog "acceptable until I or someone figures out how to build it Gentoo sytle."
}
