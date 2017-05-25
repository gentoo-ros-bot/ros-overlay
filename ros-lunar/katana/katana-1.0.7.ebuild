# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION=""
HOMEPAGE="http://ros.org/wiki/katana"
SRC_URI="https://github.com/uos-gbp/katana_driver-release/archive/release/lunar/katana/1.0.7-0.tar.gz"

LICENSE="GPL"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-lunar/urdf
    ros-lunar/trajectory_msgs
    ros-lunar/std_srvs
    ros-lunar/roscpp
    ros-lunar/kni
    ros-lunar/actionlib
    ros-lunar/roslib
    ros-lunar/sensor_msgs
    ros-lunar/control_msgs
    ros-lunar/tf
    ros-lunar/geometry_msgs
    ros-lunar/katana_msgs
    ros-lunar/moveit_msgs
    armadillo
"
DEPEND="
    ros-lunar/urdf
    ros-lunar/trajectory_msgs
    ros-lunar/std_srvs
    ros-lunar/roscpp
    ros-lunar/kni
    ros-lunar/actionlib
    ros-lunar/roslib
    ros-lunar/sensor_msgs
    ros-lunar/control_msgs
    ros-lunar/tf
    ros-lunar/geometry_msgs
    ros-lunar/katana_msgs
    ros-lunar/moveit_msgs
    armadillo
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