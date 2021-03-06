# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Robot-independent Gazebo plugins for sensors, motors and dynamic reconfigurable "
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-gbp/gazebo_ros_pkgs-release/archive/release/kinetic/gazebo_plugins/2.5.12-0.tar.gz"

LICENSE="BSD, Apache 2.0"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/angles
    ros-kinetic/nav_msgs
    ros-kinetic/std_msgs
    ros-kinetic/tf2_ros
    ros-kinetic/rosgraph_msgs
    ros-kinetic/image_transport
    ros-kinetic/message_generation
    ros-kinetic/sensor_msgs
    ros-kinetic/rostest
    ros-kinetic/cv_bridge
    ros-kinetic/camera_info_manager
    ros-kinetic/nodelet
    ros-kinetic/dynamic_reconfigure
    ros-kinetic/rospy
    ros-kinetic/polled_camera
    ros-kinetic/roscpp
    ros-kinetic/urdf
    ros-kinetic/trajectory_msgs
    ros-kinetic/std_srvs
    ros-kinetic/tf
    ros-kinetic/rosconsole
    ros-kinetic/gazebo_ros
    ros-kinetic/geometry_msgs
    ros-kinetic/gazebo_msgs
    sci-electronics/gazebo
"
DEPEND="${RDEPEND}
    ros-kinetic/diagnostic_updater
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
