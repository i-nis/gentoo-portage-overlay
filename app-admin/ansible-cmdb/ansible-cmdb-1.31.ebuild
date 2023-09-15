# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="Ansible Configuration Management Database"
HOMEPAGE="https://github.com/fboender/ansible-cmdb"
SRC_URI="https://github.com/fboender/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="
	dev-python/mako[${PYTHON_USEDEP}]
	dev-python/jsonxs[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]"
