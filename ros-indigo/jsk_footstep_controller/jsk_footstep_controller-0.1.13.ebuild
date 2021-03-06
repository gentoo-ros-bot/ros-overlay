# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="The jsk_footstep_controller package"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/tork-a/jsk_control-release/archive/release/indigo/jsk_footstep_controller/0.1.13-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/tf2
    ros-indigo/dynamic_reconfigure
    ros-indigo/tf_conversions
    ros-indigo/message_generation
    ros-indigo/message_filters
    ros-indigo/jsk_footstep_planner
    ros-indigo/jsk_footstep_msgs
    ros-indigo/geometry_msgs
    ros-indigo/sound_play
    ros-indigo/jsk_pcl_ros
    ros-indigo/urdf
    ros-indigo/genmsg
    ros-indigo/diagnostic_msgs
    ros-indigo/jsk_topic_tools
    ros-indigo/std_msgs
    ros-indigo/sensor_msgs
    ros-indigo/kdl_conversions
    ros-indigo/tf
    ros-indigo/kdl_parser
    ros-indigo/diagnostic_updater
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
