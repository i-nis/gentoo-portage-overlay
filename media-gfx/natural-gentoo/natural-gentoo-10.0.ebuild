# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

inherit eutils

DESCRIPTION="Fbcondecor theme created and designed for the Gentoo Linux."
HOMEPAGE="http://jtyr.github.io/natural-gentoo"
SRC_URI="https://github.com/jtyr/${PN}/archive/${PV}.zip"

SLOT=0
LICENSE="GPL-2"
KEYWORDS="amd64 x86"
IUSE=""
RESTRICT="binchecks strip"

DEPEND="media-gfx/splashutils"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${P}

src_unpack() {
	unpack ${A}
	}

	src_install() {
		cp -r "${S}"/etc "${D}"/
	}
