# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="rosconsole_bridge is a package used in conjunction with console_bridge and rosconsole for connecting console_bridge-based logging to rosconsole-based logging."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-gbp/rosconsole_bridge-release/archive/release/lunar/rosconsole_bridge/0.4.4-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-lunar/rosconsole
    libconsole-bridge-dev
"
DEPEND="
    ros-lunar/rosconsole
    libconsole-bridge-dev
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo

src_unpack() {
    wget -O ${P}.tar.gz ${SRC_URI}
    tar -xf ${P}.tar.gz
    rm -f ${P}.tar.gz
    mv *${P}* ${P}
}

src_configure() {
    mkdir ${WORKDIR}/src
    cp -R ${WORKDIR}/${P} ${WORKDIR}/src/${P}
}

src_compile() {
    echo ""
}

src_install() {
    echo ""
}

pkg_postinst() {
    cd ../work
    source /opt/ros/lunar/setup.bash
    catkin_make_isolated --install --install-space="/opt/ros/lunar" || die
}