# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="An Gentoo Plymouth theme Based of Ubuntu Plymouth Theme."
HOMEPAGE="https://www.gentoo.org"
S="${FILESDIR}"
LICENSE="GPL-2"
SLOT="0"

RDEPEND=">=sys-boot/plymouth-0.9.2"

KEYWORDS="amd64 x86"

src_install() {
insinto /usr/share/plymouth/themes
doins -r gentoo-logo

insinto /etc/plymouth/
doins -r plymouthd.conf
}

pkg_postinst() {
	elog "${PN} ${PV} installed successfully in your system"
}
