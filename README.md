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
More details at the [project page](http://www.risacher.org/sunwait/).

### app-text

#### aspell-0.60.6.1

* Add HU and HY language dependencies to ebuild so when using the LINGUAS
variable in make.conf the appropriate dictionaries are pulled in.
See [#456090](https://bugs.gentoo.org/show_bug.cgi?id=456090)

### kde-misc

#### plasma-nm-0.9.3.5

* Patch for compatibility with openconnect-7.01
See [#532294](https://bugs.gentoo.org/show_bug.cgi?id=532294)

### net-misc

#### youtube-viewer-3.1.1-r1

* Add dev-perl/XML-Fast as a dependency to avoid constant error messages when
using the GTK interface.
See [#525818](https://bugs.gentoo.org/show_bug.cgi?id=525818)

### sci-electronics

#### kicad-20150320

* Add latest version of KiCAD as Gentoo portage version is unmaintained.
See [#499040](https://bugs.gentoo.org/show_bug.cgi?id=499040) and
[#263053](https://bugs.gentoo.org/show_bug.cgi?id=263053). This is a package
for elec tronic schematic and PCB design.

### sci-misc

#### imagej-1.49n

* Read and write GIF, JPEG, and ASCII. Read BMP, DICOM, and FITS.
More details at the [project page](http://imagej.nih.gov/ij/)

### sys-auth

#### oath-toolkit

* The OATH Toolkit provide components for building one-time password
authentication systems. It contains shared libraries, command line tools
and a PAM module. Read more at the 
[project page](http://www.nongnu.org/oath-toolkit/).
Also see [#401409](https://bugs.gentoo.org/show_bug.cgi?id=401409)
