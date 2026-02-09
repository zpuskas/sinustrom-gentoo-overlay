Sinustrom Gentoo Overlay
========================

**NOTICE: This overlay has been migrated to 
[Codeberg](https://codeberg.org/zpuskas/sinustrom-gentoo-overlay)!
This repository has been archived, will receive no further updates, and will be
deleted on 2026-09-01! Please follow the 
[news item](metadata/news/2026-02-09-sinustrom-overlay-migration/2026-02-09-sinustrom-overlay-migration.en.txt)
on how to migrate your local overlay checkout!**

This Gentoo overlay contains only a few selected packages,
mainly because one of the following reasons:

* Not in official Gentoo portage tree
* Not in the overlays offered by layman or without a maintainer
* Broken in the above repos (and can't wait for it to be fixed)
* Experimental package or for testing purposes

## Adding this overlay to your system

Just run the following command to add it:

    # eselect repository enable sinustrom

For more details on managing overlays, please visit the related
[Gentoo Wiki](https://wiki.gentoo.org/wiki/Eselect/Repository) page.
