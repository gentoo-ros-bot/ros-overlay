# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Tests for MAVROS package"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/mavlink/mavros-release/archive/release/lunar/test_mavros/0.19.0-0.tar.gz"

LICENSE="UNKNOWN"
KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-lunar/control_toolbox
    ros-lunar/roscpp
    ros-lunar/mavros
    ros-lunar/std_msgs
    ros-lunar/eigen_conversions
    ros-lunar/mavros_extras
    ros-lunar/geometry_msgs
    ros-lunar/tf2_ros
    eigen
"
DEPEND="
    ros-lunar/control_toolbox
    ros-lunar/roscpp
    ros-lunar/tf2_ros
    ros-lunar/mavros
    ros-lunar/std_msgs
    ros-lunar/eigen_conversions
    ros-lunar/cmake_modules
    ros-lunar/mavros_extras
    ros-lunar/geometry_msgs
    ros-lunar/angles
    eigen
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