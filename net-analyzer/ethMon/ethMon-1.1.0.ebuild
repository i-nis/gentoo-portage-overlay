# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DESCRIPTION="Icinga2/Nagios plugin for network traffic monitoring."
HOMEPAGE="https://github.com/githubDante/ethMon"
SRC_URI="https://github.com/githubDante/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+minimal"

RDEPEND="
	acct-group/nagios
	acct-user/nagios
	app-admin/sudo"

PATCHES=(
	"${FILESDIR}"/ethMon-db.patch
)

src_install() {
	exeinto "/usr/$(get_libdir)/nagios/plugins"
	dodir "/usr/$(get_libdir)/nagios/plugins"
	doexe "${PN}"
	insinto /etc/sudoers.d/
	doins "${FILESDIR}"/ethMon

	if use !minimal; then
		insinto /etc/icinga2/zones.d/global-templates
		doins "${FILESDIR}"/ethMon.conf
	fi
}
