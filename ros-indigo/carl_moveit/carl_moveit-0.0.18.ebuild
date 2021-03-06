# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="MoveIt! Configuration and ROS Interface for CARL"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/gt-rail-release/carl_moveit-release/archive/release/indigo/carl_moveit/0.0.18-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/moveit_planners_ompl
    ros-indigo/moveit_ros_planning_interface
    ros-indigo/geometry_msgs
    ros-indigo/xacro
    ros-indigo/actionlib
    ros-indigo/std_srvs
    ros-indigo/actionlib_msgs
    ros-indigo/message_runtime
    ros-indigo/pcl_ros
    ros-indigo/moveit_ros_move_group
    ros-indigo/roscpp
    ros-indigo/rail_manipulation_msgs
    ros-indigo/std_msgs
    ros-indigo/sensor_msgs
    ros-indigo/control_msgs
    ros-indigo/carl_description
    ros-indigo/robot_state_publisher
    ros-indigo/pcl_conversions
    ros-indigo/wpi_jaco_msgs
    ros-indigo/joint_state_publisher
"
DEPEND="${RDEPEND}
    ros-indigo/cmake_modules
    ros-indigo/message_generation
    ros-indigo/tf
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
