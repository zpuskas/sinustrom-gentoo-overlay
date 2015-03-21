# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
PYTHON_COMPAT=( python2_7 )

WX_GTK_VER="3.0"

inherit cmake-utils wxwidgets fdo-mime gnome2-utils bzr python-r1 flag-o-matic

DESCRIPTION="Electronic Schematic and PCB design tools."
HOMEPAGE="http://www.kicad-pcb.org"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64"

EBZR_REPO_URI="lp:kicad"
EBZR_REVISION="5526"

IUSE="doc debug examples github minimal pdf python webkit"

LANGS="bg ca cs de el_GR en es fi fr hu it ja ko nl pl pt ru sl sv zh_CN"
LINGUAS=""

for lang in ${LANGS}; do
	LINGUAS+=" linguas_${lang}"
done
IUSE+=" ${LINGUAS}"
REQUIRED_USE="pdf? ( || ( ${LINGUAS} ) )"


CDEPEND="x11-libs/wxGTK:${WX_GTK_VER}[X,opengl,webkit?]
	python? ( dev-python/wxpython:${WX_GTK_VER}[opengl] )
	x11-libs/cairo
	media-libs/glew
	app-arch/bzip2"
DEPEND="${CDEPEND}
	dev-vcs/bzr
	dev-vcs/bzrtools
	>=dev-util/cmake-2.8.12.2
	>=dev-libs/boost-1.54[context,threads,python?]
	app-arch/xz-utils
	doc? ( app-doc/doxygen )"
RDEPEND="${CDEPEND}
	sys-libs/zlib
	sci-electronics/electronics-menu"

src_unpack() {
	bzr_src_unpack

	if use pdf; then
		EBZR_REPO_URI="lp:~kicad-developers/kicad/doc" \
		EBZR_PROJECT="kicad-doc" \
		EBZR_UNPACK_DIR="${EBZR_UNPACK_DIR}/kicad-doc" \
		EBZR_CACHE_DIR="kicad-doc" \
		EBZR_REVISION="" \
		bzr_fetch
	fi

	if ! use minimal; then
		EBZR_REPO_URI="lp:~kicad-product-committers/kicad/library" \
		EBZR_PROJECT="kicad-library" \
		EBZR_UNPACK_DIR="${EBZR_UNPACK_DIR}/kicad-library" \
		EBZR_CACHE_DIR="kicad-library" \
		EBZR_REVISION="" \
		bzr_fetch
	fi
}

src_prepare() {
	if use python;then
		# dev-python/wxpython don't support python3
		sed '/set(_PYTHON3_VERSIONS 3.3 3.2 3.1 3.0)/d' -i CMakeModules/FindPythonLibs.cmake || die "sed failed"
	fi

	if use pdf;then
		for lang in ${LANGS};do
			for x in ${lang};do
				if ! use linguas_${x}; then
					sed "s| \<${x}\>||" -i kicad-doc/{internat,doc/{help,tutorials}}/CMakeLists.txt || die "sed failed"
				fi
			done
		done
	fi

	# Add important doc files
	sed -e 's/INSTALL.txt/AUTHORS.txt CHANGELOG.txt README.txt TODO.txt/' -i CMakeLists.txt || die "sed failed"

	# Handle optional minimal install
	if use minimal; then
		sed -e '/add_subdirectory( template )/d' -i CMakeLists.txt || die "sed failed"
	else
		sed '/add_subdirectory( bitmaps_png )/a add_subdirectory( kicad-library )' -i CMakeLists.txt || die "sed failed"
		sed '/make uninstall/,/# /d' -i kicad-library/CMakeLists.txt || die "sed failed"
	fi

	# Add documentation and fix necessary code if requested
	if use pdf; then
		sed '/add_subdirectory( bitmaps_png )/a add_subdirectory( kicad-doc )' -i CMakeLists.txt || die "sed failed"
		sed '/make uninstall/,$d' -i kicad-doc/CMakeLists.txt || die "sed failed"
	fi

	# Install examples in the right place if requested
	if use examples; then
		sed -e 's:${KICAD_DATA}/demos:${KICAD_DOCS}/examples:' -i CMakeLists.txt || die "sed failed"
	else
		sed -e '/add_subdirectory( demos )/d' -i CMakeLists.txt || die "sed failed"
	fi
}

src_configure() {
	bzr whoami "anonymous"
	if use amd64;then
		append-cxxflags -fPIC
	fi
	need-wxwidgets unicode

	mycmakeargs="${mycmakeargs}
		-DKICAD_DOCS=/usr/share/doc/${PF}
		-DKICAD_HELP=/usr/share/doc/${PF}
		-DwxUSE_UNICODE=ON
		-DKICAD_SKIP_BOOST=ON
		$(cmake-utils_use webkit KICAD_USE_WEBKIT)
		$(cmake-utils_use github BUILD_GITHUB_PLUGIN)
		$(cmake-utils_use python KICAD_SCRIPTING)
		$(cmake-utils_use python KICAD_SCRIPTING_MODULES)
		$(cmake-utils_use python KICAD_SCRIPTING_WXPYTHON)"
	cmake-utils_src_configure
}

src_compile() {
	use doc && doxygen Doxyfile
}

src_install() {
	cmake-utils_src_install
	if use doc ; then
		insinto /usr/share/doc/${PF}
		doins uncrustify.cfg
		cd Documentation
		doins -r GUI_Translation_HOWTO.pdf guidelines/UIpolicies.txt doxygen/*
	fi
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
	gnome2_icon_cache_update

	if use minimal ; then
		ewarn "If the schematic and/or board editors complain about missing libraries when you"
		ewarn "open old projects, you will have to take one or more of the following actions :"
		ewarn "- Install the missing libraries manually."
		ewarn "- Remove the libraries from the 'Libs and Dir' preferences."
		ewarn "- Fix the libraries' locations in the 'Libs and Dir' preferences."
		ewarn "- Emerge kicad without the 'minimal' USE flag."
		elog
	fi
	elog "You may want to emerge media-gfx/wings if you want to create 3D models of components."
}

pkg_postrm() {
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
	gnome2_icon_cache_update
}
