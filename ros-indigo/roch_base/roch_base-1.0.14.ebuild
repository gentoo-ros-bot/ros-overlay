# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Sawyer Roch robot driver"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/SawYerRobotics-release/roch_robot-release/archive/release/indigo/roch_base/1.0.14-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/nodelet
    ros-indigo/topic_tools
    ros-indigo/tf
    ros-indigo/angles
    ros-indigo/controller_manager
    ros-indigo/roch_description
    ros-indigo/geometry_msgs
    ros-indigo/roch_msgs
    ros-indigo/roscpp
    ros-indigo/diff_drive_controller
    ros-indigo/diagnostic_msgs
    ros-indigo/std_msgs
    ros-indigo/diagnostic_aggregator
    ros-indigo/sensor_msgs
    ros-indigo/roch_control
    ros-indigo/hardware_interface
    ros-indigo/diagnostic_updater
"
DEPEND="${RDEPEND}
    ros-indigo/roslint
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
