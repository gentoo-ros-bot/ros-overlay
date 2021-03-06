# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Gazebo Plugins for various PR2-specific sensors and actuators on the robot."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/pr2-gbp/pr2_simulator-release/archive/release/indigo/pr2_gazebo_plugins/2.0.7-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/angles
    ros-indigo/nav_msgs
    ros-indigo/driver_base
    ros-indigo/std_msgs
    ros-indigo/pr2_controller_manager
    ros-indigo/pr2_msgs
    ros-indigo/pr2_mechanism_model
    ros-indigo/image_transport
    ros-indigo/message_generation
    ros-indigo/message_runtime
    ros-indigo/diagnostic_msgs
    ros-indigo/sensor_msgs
    ros-indigo/cv_bridge
    ros-indigo/rospy
    ros-indigo/polled_camera
    ros-indigo/roscpp
    ros-indigo/urdf
    ros-indigo/tf
    ros-indigo/diagnostic_updater
    ros-indigo/gazebo_ros
    ros-indigo/geometry_msgs
    ros-indigo/pr2_hardware_interface
    ros-indigo/orocos_kdl
    ros-indigo/gazebo_plugins
    ros-indigo/gazebo_msgs
    sci-electronics/gazebo
"
DEPEND="${RDEPEND}
    ros-indigo/std_srvs
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
