# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit eutils distutils-r1 gnome2-utils python-r1 versionator

DESCRIPTION="btsync GTK UI for Linux systems"
HOMEPAGE="http://www.yeasoft.com/site/projects:btsync-deb:btsync-gui"
SRC_URI="http://www.yeasoft.com/downloads/btsync-deb/${PN}/${PN}_${PV}.orig.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
LANGS="bg cs de es fr gl hu it nl pl ru"
for lang in ${LANGS}; do
   IUSE+=" linguas_${lang}"
done


DEPEND="
   ${PYTHON_DEPS}
   media-gfx/qrencode-python[${PYTHON_USEDEP}]
   dev-python/dbus-python[${PYTHON_USEDEP}]
   dev-python/requests[${PYTHON_USEDEP}]
   net-p2p/btsync
   dev-libs/openssl[-bindist]
"
RDEPEND="${DEPEND}"

src_unpack() {
   unpack ${A}
   mv ${WORKDIR}/${PN} ${WORKDIR}/${P} 
   python_setup 'python2*'
}

src_prepare() {
   DHOME=$(python_get_sitedir)/${PN}
   epatch "${FILESDIR}/${P}-path.patch"
   sed -e "s|append('.*')|append\('${DHOME}/lib')|" -i ${PN} || die "sed failed"
}

src_compile() {
   # No makefile or setup.py
   for lang in ${LANGS}; do
      if use linguas_${lang}; then
         msgfmt -o po/${lang}.mo po/${lang}.po
      fi
   done
}

src_install() {
   # Still no makefile, so just do my best manually
   dodir /usr/share/${PN}

   # install btsync key
   insinto /usr/share/${PN}
   doins ${FILESDIR}/${PN}.key

    # install libraries
   DHOME=$(python_get_sitedir)/${PN}
   insinto ${DHOME}/lib
   doins -r ${S}/*.py
   doins -r ${S}/*.glade

   # install "main"
   exeinto ${DHOME}
   python_fix_shebang ${PN}
   doexe ${PN}

   # executeable symlink
   dosym ${DHOME}/${PN} /usr/bin/${PN}

   # desktop environment menu
   domenu ${PN}.desktop

   # man page
   doman ${PN}.7

   # docs
   dodoc README.md CREDITS.md

   # icons
   insinto /usr/share/icons/hicolor/
   doins -r icons/*
   
    # language
   for lang in ${LANGS}; do
      if use linguas_${lang}; then
         insinto /usr/share/locale/${lang}/LC_MESSAGES
         newins po/${lang}.mo ${PN}.mo
      fi
   done
}

pkg_preinst() {
   gnome2_icon_savelist
}

pkg_postinst() {
   gnome2_icon_cache_update
}

pkg_postrm() {
   gnome2_icon_cache_update
}
