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

#### jstock-1.0.7.10

* jstock is a free stock market application intended towards more serious traders.
Allows to follow and manage your stock portfolio. Due to building environment
constraints it's a binary package for now.

### app-vim

#### extra-syntax-4-r2

* VIM extra syntax files for highlighting. Fix merge issue for version 4 until it
is fixed in the main tree. [#592162](https://bugs.gentoo.org/show_bug.cgi?id=592162)

### dev-db

#### sqlite-2.8.16-r5

* sqlite2 is the previous version of the popular embedded relational database.
Since it was dropped from main tree, I'll make it available here for compatibility
and porting data.

### dev-embedded

#### xr21v1410-1a

* Exar XR21V1410 series UART to USB serial kernel drivers. Supported devices are
XR21V1410/1412/1414, XR21B1411, XR21B1420/1422/1424, XR22801/802/804.

### dev-python

#### csvkit-0.9.2-r1

* A suite of utilities for converting to and working with CSV

### media-libs

#### libid3tag-0.15.1b-r5

* MAD id3tag library. Fix issue when building with dev-util/gperf-3.1 bug
[#605158](https://bugs.gentoo.org/show_bug.cgi?id=605158)

### media-sound

### audacity-2.0.5-r2

* Free crossplatform audio editor. Fix issue when compiling with GCC6.3 (C++14).
[#595764](https://bugs.gentoo.org/show_bug.cgi?id=595764)

#### cursetag

* NCurses based audio file tag (metadata) editor. 

#### musescore-2.0.1

* WYSIWYG Music Score Typesetter

### net-libs

#### opal-3.10.11-r1

* C++ class library normalising numerous telephony protocols. Fix ffmpeg compatibility
issue. [#575230](https://bugs.gentoo.org/show_bug.cgi?id=575230)

### net-misc

#### casync-2

* A tool for distributing file system images. Similar to rsync, only it uses a content
addressable data algorithm.

### net-p2p

#### btsync-1.4.106

* Bittorrent sync package

#### btsync-gui-0.8.5

* Bittorrent sync GTK UI for Linux systems.

### sys-auth

#### oath-toolkit-2.6.2

* Toolkit for using one-time password authentication with HOTP/TOTP algorithms  
