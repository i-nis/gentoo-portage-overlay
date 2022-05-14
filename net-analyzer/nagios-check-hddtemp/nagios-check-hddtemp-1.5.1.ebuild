# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Nagios-plugin that uses hddtemp to check disk temperature over the network."
HOMEPAGE="https://github.com/vint21h/nagios-check-hddtemp"
SRC_URI="${HOMEPAGE}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND=""
RDEPEND="${DEPEND}
	acct-group/nagios
	acct-user/nagios
	app-admin/hddtemp"

python_install_all() {
	dodir "/usr/$(get_libdir)/nagios/plugins"
	dosym ../../../bin/check_hddtemp.py "/usr/$(get_libdir)/nagios/plugins/check_hddtemp"
}
