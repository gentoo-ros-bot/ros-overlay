# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION=""
HOMEPAGE="http://wiki.ros.org/robot_state_publisher"
SRC_URI="https://github.com/ros-gbp/robot_state_publisher-release/archive/release/indigo/robot_state_publisher/1.11.2-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/tf_conversions
    ros-indigo/rosconsole
    ros-indigo/orocos_kdl
    ros-indigo/roscpp
    ros-indigo/catkin
    ros-indigo/tf2_kdl
    ros-indigo/sensor_msgs
    ros-indigo/rostime
    ros-indigo/tf2_ros
    ros-indigo/tf
    ros-indigo/kdl_parser
    dev-cpp/eigen
"
DEPEND="${RDEPEND}
    ros-indigo/cmake_modules
    ros-indigo/rostest
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="opt/ros/indigo"

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
    cd ../../work
    source /${ROS_PREFIX}/setup.bash
    catkin_make_isolated --install --install-space="${D}/${ROS_PREFIX}" || die
    if [[ -e /${ROS_PREFIX}/setup.bash ]]; then
        rm -f ${D}/${ROS_PREFIX}/{.catkin,_setup_util.py,env.sh,setup.bash,setup.sh}
        rm -f ${D}/${ROS_PREFIX}/{setup.zsh,.rosinstall}
    fi
}
