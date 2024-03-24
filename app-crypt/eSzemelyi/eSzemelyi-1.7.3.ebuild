# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop unpacker xdg-utils

MY_PV=$(ver_rs 1- _)
DESCRIPTION="Electronic Identity Card middleware supplied by the Hungarian Government"
HOMEPAGE="https://eszemelyi.hu"
SRC_URI="https://eszemelyi.hu/wp-content/uploads/2023/05/${PN}_Kliens_x64_${MY_PV}.deb"

LICENSE="eSzemelyi-EULA"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/cyberjack
	dev-libs/openssl:0=
	>=dev-qt/qtcore-5.5.1
	>=dev-qt/qtdbus-5.5.1
	>=dev-qt/qtgui-5.5.1
	>=dev-qt/qtgui-5.5.1
	>=dev-qt/qtnetwork-5.5.1
	>=dev-qt/qtwidgets-5.5.1
	sys-apps/pcsc-lite
"
RDEPEND="${DEPEND}"
IDEPEND="
	dev-util/desktop-file-utils
	dev-util/gtk-update-icon-cache
"

S="${WORKDIR}"

QA_PREBUILT="
	opt/${PN}/bearer
	opt/${PN}/eszig-cmu
	opt/${PN}/eszig-eid
	opt/${PN}/eszig-pkcs11.so.1.1.2
	opt/${PN}/libjx.so
"

src_prepare() {
	eapply_user

	sed -i -e "s|/usr/lib/ESZEMELYI|/opt/${PN}|" usr/share/applications/eszig-cmu.desktop || die "Sed failed!"
	sed -i -e "s|Categories=Application|Categories=Office|" usr/share/applications/eszig-cmu.desktop || die "Sed failed!"
}

src_install() {
	# Install only package specific files, dependencies can be used from the OS
	insinto /opt/${PN}
	doins usr/lib/ESZEMELYI/bearer
	doins usr/lib/ESZEMELYI/eszig*
	doins usr/lib/ESZEMELYI/libjx.so
	dosym ../../opt/${PN}/eszig-cmu /usr/bin/eszig-cmu
	dosym ../../opt/${PN}/eszig-eid /usr/bin/eszig-eid
	dosym ../../opt/${PN}/eszig-pkcs11.so.1.1.2 /usr/lib64/eszig-pkcs11.so
	dosym ../../opt/${PN}/libjx.so /usr/lib64/libjx.so
	doins -r usr/lib/ESZEMELYI/help

	# Install non binary items
	domenu usr/share/applications/eszig-cmu.desktop
	dodoc usr/lib/ESZEMELYI/release-notes.txt

	# Make binaries executable
	fperms +x /opt/${PN}/bearer
	fperms +x /opt/${PN}/eszig-cmu
	fperms +x /opt/${PN}/eszig-eid
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}
