# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DESCRIPTION="Nagios/Icinga plugins for servers."
HOMEPAGE="https://proyectos.nis.com.ar/projects/monitoring_plugins"
SRC_URI="https://gitlab.com/i-nis/monitoring_plugins/-/archive/v${PV}/monitoring_plugins-v${PV}.tar.bz2 -> ${P}.tar.bz2"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+minimal"

RDEPEND="
	acct-group/nagios
	acct-user/nagios
	app-admin/hddtemp"

src_unpack() {
	unpack ${A}
	mv "${WORKDIR}/monitoring_plugins-v${PV}" "${WORKDIR}/${P}" || die "Install failed!"
}

src_install() {
	exeinto "/usr/$(get_libdir)/nagios/plugins"
	dodir "/usr/$(get_libdir)/nagios/plugins"
	doexe plugins/*
	insinto /etc/sudoers.d
	doins sudoers.d/*

	if use !minimal; then
		insinto /etc/icinga2/zones.d/global-templates
		doins icinga2/global-templates/*
	fi

}
