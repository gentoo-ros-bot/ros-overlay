# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="An automatically generated package with all the configuration and launch files f"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/clearpath-gbp/husky-release/archive/release/indigo/husky_ur5_moveit_config/0.2.7-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/moveit_planners_ompl
    ros-indigo/xacro
    ros-indigo/warehouse_ros
    ros-indigo/moveit_ros_visualization
    ros-indigo/moveit_setup_assistant
    ros-indigo/moveit_ros_move_group
    ros-indigo/rviz
    ros-indigo/moveit_ros_benchmarks
    ros-indigo/robot_state_publisher
    ros-indigo/moveit_ros_warehouse
    ros-indigo/joint_state_publisher
"
DEPEND="${RDEPEND}
    ros-indigo/roslaunch
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
