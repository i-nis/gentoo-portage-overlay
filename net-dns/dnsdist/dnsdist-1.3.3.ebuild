# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit toolchain-funcs flag-o-matic eutils versionator

DESCRIPTION="dnsdist is a highly DNS-, DoS- and abuse-aware loadbalancer"
HOMEPAGE="http://dnsdist.org/"
SRC_URI="https://downloads.powerdns.com/releases/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="luajit protobuf snmp systemd"

DEPEND="
	luajit? ( dev-lang/luajit:= )
	!luajit? ( >=dev-lang/lua-5.1:= )
	snmp? ( net-analyzer/net-snmp:= )
	protobuf? (
		dev-libs/protobuf
		>=dev-libs/boost-1.42
	)
	systemd? ( sys-apps/systemd:0= )
	>=dev-libs/boost-1.35
	dev-libs/libsodium
	dev-libs/libedit
	dev-libs/re2
"

DEPEND="${DEPEND}"

pkg_setup() {
	filter-flags -ftree-vectorize
}

src_configure() {
	econf \
		--sysconfdir=/etc/${PN} \
		--enable-re2 \
		--enable-libsodium \
		--enable-dnscrypt \
		--enable-dns-over-tls \
		--with-lua \
		$(use_enable systemd) \
		$(use_with protobuf) \
		$(use_with snmp net-snmp)
}

src_install() {
	default
	insinto /etc/dnsdist
	doins "${FILESDIR}"/dnsdist.conf.example
	newconfd "${FILESDIR}"/dnsdist.confd ${PN}
	doinitd "${FILESDIR}"/${PN}
}

pkg_preinst() {
	enewgroup dnsdist
	enewuser dnsdist -1 -1 -1 dnsdist
}
