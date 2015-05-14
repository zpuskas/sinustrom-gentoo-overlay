# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/LWP-UserAgent-Determined/LWP-UserAgent-Determined-1.60.0-r1.ebuild,v 1.1 2014/08/26 19:01:22 axs Exp $

EAPI=5

MODULE_AUTHOR=OLEG
MODULE_VERSION=0.06
inherit perl-module

DESCRIPTION="LWP::UserAgent with simple caching mechanism"

SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux ~x86-solaris"
IUSE=""

RDEPEND="dev-perl/libwww-perl"

SRC_TEST=no
