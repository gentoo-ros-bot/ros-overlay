# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="This package provides launch files for starting a simulated Care-O-bot."
HOMEPAGE="http://ros.org/wiki/cob_bringup_sim"
SRC_URI="https://github.com/ipa320/cob_simulation-release/archive/release/indigo/cob_bringup_sim/0.6.7-0.tar.gz"

LICENSE="LGPL"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/rospy
    ros-indigo/gazebo_ros
    ros-indigo/geometry_msgs
    ros-indigo/cob_default_env_config
    ros-indigo/roslaunch
    ros-indigo/roslib
    ros-indigo/cob_gazebo_worlds
    ros-indigo/cob_gazebo
    ros-indigo/gazebo_msgs
    ros-indigo/tf
    ros-indigo/cob_default_robot_config
    dev-python/numpy
"
DEPEND="${RDEPEND}
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
