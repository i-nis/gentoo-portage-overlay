# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{7..9} )
DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1

DESCRIPTION="This package contains tools for authenticating to an OpenStack-based cloud."
HOMEPAGE="https://github.com/openstack/keystoneauth"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}1/${PN}1-${PV}.tar.gz"
S="${WORKDIR}/${PN}1-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ~arm arm64 x86"
IUSE=""

CDEPEND=">=dev-python/pbr-2.0.0[${PYTHON_USEDEP}]
	!~dev-python/pbr-2.1.0"
DEPEND="${CDEPEND}"
RDEPEND="${CDEPEND}
	>=dev-python/iso8601-0.1.11[${PYTHON_USEDEP}]
	>=dev-python/requests-2.14.2[${PYTHON_USEDEP}]
	>=dev-python/six-1.10.0[${PYTHON_USEDEP}]
	>=dev-python/stevedore-1.20.0[${PYTHON_USEDEP}]
	>=dev-python/os-service-types-1.2.0[${PYTHON_USEDEP}]"
