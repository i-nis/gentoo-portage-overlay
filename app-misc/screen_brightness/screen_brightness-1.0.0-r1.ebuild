# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Increase or decrease the brightness of your monitor by 10%."
HOMEPAGE="https://www.nis.com.ar"
S="${FILESDIR}"
LICENSE="GPL-3"
SLOT="0"

RDEPEND="app-misc/ddcutil[user-permissions]"

KEYWORDS="amd64 x86"

src_install() {
	dobin screen_brightness
}

pkg_postinst() {
	einfo "${PN} ${PV} installed successfully in your system."
	einfo "To increase the brightness you can use '${PN} up'."
	einfo "To decrease the brightness use '${PN} down' instead."
	einfo "Each of these commands can be associated with a key combination of your choice."
}
