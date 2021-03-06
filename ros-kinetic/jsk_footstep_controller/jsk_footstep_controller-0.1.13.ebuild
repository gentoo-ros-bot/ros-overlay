# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="The jsk_footstep_controller package"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/tork-a/jsk_control-release/archive/release/kinetic/jsk_footstep_controller/0.1.13-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/tf2
    ros-kinetic/dynamic_reconfigure
    ros-kinetic/tf_conversions
    ros-kinetic/message_generation
    ros-kinetic/message_filters
    ros-kinetic/jsk_footstep_planner
    ros-kinetic/jsk_footstep_msgs
    ros-kinetic/geometry_msgs
    ros-kinetic/sound_play
    ros-kinetic/jsk_pcl_ros
    ros-kinetic/urdf
    ros-kinetic/genmsg
    ros-kinetic/diagnostic_msgs
    ros-kinetic/jsk_topic_tools
    ros-kinetic/std_msgs
    ros-kinetic/sensor_msgs
    ros-kinetic/kdl_conversions
    ros-kinetic/tf
    ros-kinetic/kdl_parser
    ros-kinetic/diagnostic_updater
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
