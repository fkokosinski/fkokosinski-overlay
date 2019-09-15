# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
DESCRIPTION="Yosys Open SYNthesis Suite"
HOMEPAGE="http://www.clifford.at/yosys/"

ABCREV="3709744"
SRC_URI="
	https://github.com/YosysHQ/${PN}/archive/${P}.tar.gz
	https://github.com/berkeley-abc/abc/tarball/${ABCREV} -> abc-${ABCREV}.tar.gz
"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}-${P}"

src_prepare() {
	eapply_user

	sed -i -e "s/${ABCREV}/default/" Makefile || die "Sed failed!"
}

src_compile() {
	mv ../berkeley-abc-abc-${ABCREV} abc
	make config-gcc
	emake
}