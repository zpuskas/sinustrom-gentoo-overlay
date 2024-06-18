# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="RobotoMono"
if [[ -z ${PV%%*9999} ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/googlefonts/${MY_PN}.git"
else
	MY_PV="3479a228ba99f69d6e504e7d798a3f8e8239bbe7"
	[[ -n ${PV%%*_p*} ]] && MY_PV="v${PV/_/-}"
	SRC_URI="
		https://github.com/googlefonts/${MY_PN}/archive/${MY_PV}.tar.gz -> ${P}.tar.gz
	"
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${MY_PN}-${MY_PV}"
fi
inherit font

DESCRIPTION="A monospaced addition to the Roboto type family"
HOMEPAGE="https://github.com/googlefonts/RobotoMono"

LICENSE="Apache-2.0"
SLOT="0"

FONT_SUFFIX="ttf"
FONT_S="${S}/fonts/ttf"
