# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="industrial robot client contains generic clients for connecting 
     to industr"
HOMEPAGE="http://ros.org/wiki/industrial_robot_client"
SRC_URI="https://github.com/ros-industrial-release/industrial_core-release/archive/release/kinetic/industrial_robot_client/0.6.0-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/industrial_msgs
    ros-kinetic/control_msgs
    ros-kinetic/actionlib
    ros-kinetic/actionlib_msgs
    ros-kinetic/roscpp
    ros-kinetic/simple_message
    ros-kinetic/urdf
    ros-kinetic/std_msgs
    ros-kinetic/trajectory_msgs
    ros-kinetic/sensor_msgs
    ros-kinetic/industrial_utils
"
DEPEND="${RDEPEND}
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="opt/ros/kinetic"

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
