# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module systemd

DESCRIPTION="GitLab Agent for Kubernetes (non-cluster part)"
HOMEPAGE="https://gitlab.com/gitlab-org/cluster-integration/gitlab-agent"
SRC_URI="https://gitlab.com/gitlab-org/cluster-integration/gitlab-agent/-/archive/v${PV}/gitlab-agent-${PV}.tar.bz2 -> ${P}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

RESTRICT+=" test "

BDEPEND=">=dev-lang/go-1.25.3"

src_unpack() {
	unpack ${A}
	mv "${WORKDIR}/gitlab-agent-v${PV}"* "${WORKDIR}/${P}" || die "Install failed!"
}

src_compile() {
	emake -j1 GOFLAGS="" GOLDFLAGS="" LDFLAGS="" WHAT=cmd/kas kas
}

src_install() {
	dobin tmp/kas
	newinitd "${FILESDIR}"/${PN}.initd ${PN}
	newconfd "${FILESDIR}"/${PN}.confd ${PN}
	systemd_dounit "${FILESDIR}"/${PN}.service
	insinto /etc/gitlab-kas
	newins "${S}"/pkg/kascfg/kascfg_defaults.yaml config.yaml
}
