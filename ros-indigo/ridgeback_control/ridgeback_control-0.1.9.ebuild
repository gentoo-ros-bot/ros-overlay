# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Controllers for Ridgeback"
HOMEPAGE="http://wiki.ros.org/ridgeback_control"
SRC_URI="https://github.com/clearpath-gbp/ridgeback-release/archive/release/indigo/ridgeback_control/0.1.9-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/topic_tools
    ros-indigo/controller_manager
    ros-indigo/nav_msgs
    ros-indigo/joy
    ros-indigo/joint_state_controller
    ros-indigo/robot_localization
    ros-indigo/urdf
    ros-indigo/realtime_tools
    ros-indigo/teleop_twist_joy
    ros-indigo/tf
    ros-indigo/controller_interface
    ros-indigo/interactive_marker_twist_server
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
