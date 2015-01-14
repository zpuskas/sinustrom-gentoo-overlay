Sinustrom Gentoo Overlay
========================

This Gentoo overlay contains only a few selected packages,
mainly because one of the following reasons:

* Not in official Gentoo portage tree
* Not in the overlays offered by layman
* Broken in the above repos
* Experimental package

## Adding this overlay to your system

Save the repository XML descriptor file to **/etc/layman/overlays/** and add
overlay using layman:

    $ wget https://raw.githubusercontent.com/zpuskas/sinustrom-gentoo-overlay/master/layman.xml -O /tmp/sinustrom.xml
    $ su
    # mv /tmp/sinustrom.xml /etc/layman/overlays/sinustrom.xml
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

* Add dev-perl/XML-Fast as a depenceny to avoid constant error messages when
using the GTK interface.
See [#525818](https://bugs.gentoo.org/show_bug.cgi?id=525818)

### sci-misc

#### imagej-1.49n

* Read and write GIF, JPEG, and ASCII. Read BMP, DICOM, and FITS.
More details at the [project page](http://imagej.nih.gov/ij/)
