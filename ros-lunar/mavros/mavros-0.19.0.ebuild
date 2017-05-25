# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="MAVROS -- MAVLink extendable communication node for ROS
    with proxy for Ground Control Station."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/mavlink/mavros-release/archive/release/lunar/mavros/0.19.0-0.tar.gz"

LICENSE="UNKNOWN"
KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-lunar/nav_msgs
    ros-lunar/std_srvs
    ros-lunar/roscpp
    ros-lunar/pluginlib
    ros-lunar/rosconsole_bridge
    ros-lunar/std_msgs
    ros-lunar/message_runtime
    ros-lunar/sensor_msgs
    ros-lunar/mavlink
    ros-lunar/mavros_msgs
    ros-lunar/eigen_conversions
    ros-lunar/diagnostic_updater
    ros-lunar/libmavconn
    ros-lunar/rospy
    ros-lunar/tf2_ros
    ros-lunar/geometry_msgs
    ros-lunar/diagnostic_msgs
    boost
    eigen
"
DEPEND="
    ros-lunar/nav_msgs
    ros-lunar/tf2_ros
    ros-lunar/std_srvs
    ros-lunar/pluginlib
    ros-lunar/rosconsole_bridge
    ros-lunar/std_msgs
    ros-lunar/sensor_msgs
    ros-lunar/libmavconn
    ros-lunar/eigen_conversions
    ros-lunar/diagnostic_updater
    ros-lunar/cmake_modules
    ros-lunar/mavlink
    ros-lunar/geometry_msgs
    ros-lunar/mavros_msgs
    ros-lunar/angles
    ros-lunar/diagnostic_msgs
    ros-lunar/roscpp
    eigen
    boost
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