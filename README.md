Sinustrom Gentoo Overlay
========================

This Gentoo overlay contains only a few selected packages,
mainly because one of the following reasons:

* Not in official Gentoo portage tree
* Not in the overlays offered by layman or without a maintainer
* Broken in the above repos (and can't wait for it to be fixed)
* Experimental package or for testing purposes

## Adding this overlay to your system

Available in layman. Just run the following command to add it:

    # layman -a sinustrom

If you don't have layman setup yet, please visit the related
[Gentoo Wiki](https://wiki.gentoo.org/wiki/Layman) page.

## <a name="packages"></a>Packages in this overlay

### app-misc

#### sunwait-20041208

* Sunwait is a small C program for calculating sunrise and sunset, as well as
civil, nautical, and astronomical twilights. It has features that make it
useful for home automation tasks.

### app-office

#### jstock-1.0.7.6

* jstock is a free stock market application intended towards more serious traders.
Allows to follow and manage your stock portfolio. Due to building environment
constraints it's a binary package for now.

### app-text

#### aspell-0.60.6.1

* Add HU and HY language dependencies to ebuild so when using the LINGUAS
variable in make.conf the appropriate dictionaries are pulled in.
See [#456090](https://bugs.gentoo.org/show_bug.cgi?id=456090)

### dev-embedded

#### xr21v1410-1a

Exar XR21V1410 series UART to USB serial kernel drivers. Supported devices are
XR21V1410/1412/1414, XR21B1411, XR21B1420/1422/1424, XR22801/802/804.

### dev-python

#### csvkit-0.9.2-r1

* A suite of utilities for converting to and working with CSV

### kde-misc

#### plasma-nm-0.9.3.5

* Patch for compatibility with openconnect-7.01
See [#532294](https://bugs.gentoo.org/show_bug.cgi?id=532294)

### media-sound

#### cursetag

* NCurses based audio file tag (metadata) editor. 

### net-misc

#### youtube-viewer-3.1.9

* Add dev-perl/XML-Fast as a dependency to avoid constant error messages when
using the GTK interface, plus newer release.
* Updated version with support for new YouTube API
See [#525818](https://bugs.gentoo.org/show_bug.cgi?id=525818)

### net-p2p

#### btsync-1.4.106

* Bittorrent sync package

#### btsync-gui-0.8.5

* Bittorrent sync GTK UI for Linux systems.

### sci-electronics

#### kicad-20150320

* Add latest version of KiCAD as Gentoo portage version is unmaintained.
See [#499040](https://bugs.gentoo.org/show_bug.cgi?id=499040) and
[#263053](https://bugs.gentoo.org/show_bug.cgi?id=263053). This is a package
for electronic schematic and PCB design.

### sci-misc

#### imagej-1.49{n,q,s}

* Read and write GIF, JPEG, and ASCII. Read BMP, DICOM, and FITS.
