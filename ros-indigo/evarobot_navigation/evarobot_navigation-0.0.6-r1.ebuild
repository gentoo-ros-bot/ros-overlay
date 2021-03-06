# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="evarobot_navigation provides roslaunch script files to navigate the Evarobot."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/inomuh/evapc_ros-release/archive/release/indigo/evarobot_navigation/0.0.6-1.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/master_sync_fkie
    ros-indigo/frontier_exploration
    ros-indigo/amcl
    ros-indigo/gmapping
    ros-indigo/evarobot_state_publisher
    ros-indigo/rplidar_ros
    ros-indigo/roscpp
    ros-indigo/map_server
    ros-indigo/master_discovery_fkie
    ros-indigo/move_base
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
