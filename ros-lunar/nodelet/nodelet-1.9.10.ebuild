# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="The nodelet package is designed to provide a way to run multiple
    algorithms "
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-gbp/nodelet_core-release/archive/release/lunar/nodelet/1.9.10-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-lunar/pluginlib
    ros-lunar/message_runtime
    ros-lunar/roscpp
    ros-lunar/std_msgs
    ros-lunar/rosconsole
    ros-lunar/bondcpp
    sys-apps/util-linux
    dev-libs/boost
"
DEPEND="${RDEPEND}
    ros-lunar/cmake_modules
    ros-lunar/rospy
    ros-lunar/message_generation
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="opt/ros/lunar"

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
