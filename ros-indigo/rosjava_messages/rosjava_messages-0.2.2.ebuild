# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Message generation for rosjava."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/rosjava-release/rosjava_messages-release/archive/release/indigo/rosjava_messages/0.2.2-0.tar.gz"

LICENSE="Apache 2.0"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/rosjava_build_tools
    ros-indigo/genjava
"
DEPEND="${RDEPEND}
    ros-indigo/concert_service_msgs
    ros-indigo/rocon_service_pair_msgs
    ros-indigo/rocon_app_manager_msgs
    ros-indigo/nav_msgs
    ros-indigo/ar_track_alvar_msgs
    ros-indigo/std_msgs
    ros-indigo/gateway_msgs
    ros-indigo/rosgraph_msgs
    ros-indigo/stereo_msgs
    ros-indigo/diagnostic_msgs
    ros-indigo/sensor_msgs
    ros-indigo/concert_msgs
    ros-indigo/uuid_msgs
    ros-indigo/scheduler_msgs
    ros-indigo/world_canvas_msgs
    ros-indigo/rocon_interaction_msgs
    ros-indigo/rocon_std_msgs
    ros-indigo/actionlib_msgs
    ros-indigo/move_base_msgs
    ros-indigo/roscpp
    ros-indigo/tf2_msgs
    ros-indigo/trajectory_msgs
    ros-indigo/std_srvs
    ros-indigo/visualization_msgs
    ros-indigo/shape_msgs
    ros-indigo/rocon_device_msgs
    ros-indigo/yocs_msgs
    ros-indigo/geometry_msgs
    ros-indigo/rosjava_test_msgs
    ros-indigo/rocon_tutorial_msgs
    ros-indigo/map_store
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
