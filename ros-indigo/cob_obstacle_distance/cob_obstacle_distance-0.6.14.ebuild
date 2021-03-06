# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="The cob_obstacle_distance package"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ipa320/cob_control-release/archive/release/indigo/cob_obstacle_distance/0.6.14-0.tar.gz"

LICENSE="LGPL"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/roslib
    ros-indigo/std_msgs
    ros-indigo/rviz
    ros-indigo/robot_state_publisher
    ros-indigo/joint_state_publisher
    ros-indigo/moveit_msgs
    ros-indigo/cob_control_msgs
    ros-indigo/tf_conversions
    ros-indigo/eigen_conversions
    ros-indigo/fcl
    ros-indigo/sensor_msgs
    ros-indigo/kdl_parser
    ros-indigo/cob_srvs
    ros-indigo/cmake_modules
    ros-indigo/dynamic_reconfigure
    ros-indigo/rospy
    ros-indigo/xacro
    ros-indigo/roscpp
    ros-indigo/urdf
    ros-indigo/kdl_conversions
    ros-indigo/shape_msgs
    ros-indigo/tf
    ros-indigo/visualization_msgs
    ros-indigo/geometry_msgs
    ros-indigo/orocos_kdl
    ros-indigo/interactive_markers
    virtual/pkgconfig
    dev-cpp/eigen
    dev-libs/boost
    media-libs/assimp
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
