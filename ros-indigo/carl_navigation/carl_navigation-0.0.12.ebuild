# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Autonomous Navigation Capabilities for CARL"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/gt-rail-release/carl_navigation-release/archive/release/indigo/carl_navigation/0.0.12-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/dynamic_reconfigure
    ros-indigo/rail_maps
    ros-indigo/nav_msgs
    ros-indigo/geometry_msgs
    ros-indigo/actionlib
    ros-indigo/gmapping
    ros-indigo/rail_collada_models
    ros-indigo/actionlib_msgs
    ros-indigo/dwa_local_planner
    ros-indigo/message_runtime
    ros-indigo/move_base
    ros-indigo/move_base_msgs
    ros-indigo/roscpp
    ros-indigo/roslib
    ros-indigo/carl_description
    ros-indigo/tf
    ros-indigo/navfn
    ros-indigo/robot_pose_publisher
    ros-indigo/costmap_2d
    dev-cpp/yaml-cpp
"
DEPEND="${RDEPEND}
    ros-indigo/message_generation
    ros-indigo/rail_ceiling
    virtual/pkgconfig
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
