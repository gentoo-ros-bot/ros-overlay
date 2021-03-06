# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Calibrates the offsets of F/T sensors and the mass and position of the COM of gr"
HOMEPAGE="http://wiki.ros.org/force_torque_sensor_calib"
SRC_URI="https://github.com/ros-gbp/force_torque_tools-release/archive/release/indigo/force_torque_sensor_calib/1.0.2-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/cmake_modules
    ros-indigo/tf_conversions
    ros-indigo/moveit_ros_planning_interface
    ros-indigo/geometry_msgs
    ros-indigo/roscpp
    ros-indigo/moveit_core
    ros-indigo/moveit_ros_planning
    ros-indigo/eigen_conversions
    ros-indigo/sensor_msgs
    ros-indigo/tf
    dev-cpp/eigen
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
