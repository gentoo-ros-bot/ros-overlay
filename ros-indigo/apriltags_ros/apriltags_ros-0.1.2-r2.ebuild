# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="A package that provides a ROS wrapper for the apriltags C++ package"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/RIVeR-Lab-release/apriltags_ros-release/archive/release/indigo/apriltags_ros/0.1.2-2.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/nodelet
    ros-indigo/apriltags
    ros-indigo/image_transport
    ros-indigo/geometry_msgs
    ros-indigo/message_runtime
    ros-indigo/roscpp
    ros-indigo/std_msgs
    ros-indigo/sensor_msgs
    ros-indigo/tf
    ros-indigo/cv_bridge
"
DEPEND="${RDEPEND}
    ros-indigo/cmake_modules
    ros-indigo/message_generation
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
