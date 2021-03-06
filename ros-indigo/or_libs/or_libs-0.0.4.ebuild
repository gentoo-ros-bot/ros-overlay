# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION=""
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://gitlab.uni-koblenz.de/robbie/homer_object_recognition/archive/release/indigo/or_libs/0.0.4-0.tar.gz"

LICENSE="LGPL-v2"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/roscpp_serialization
    ros-indigo/message_runtime
    ros-indigo/robbie_architecture
    ros-indigo/std_msgs
    ros-indigo/sensor_msgs
    ros-indigo/tf
    ros-indigo/cv_bridge
    dev-libs/boost
    media-libs/opencv
    sci-libs/flann
"
DEPEND="${RDEPEND}
    ros-indigo/cmake_modules
    ros-indigo/message_generation
    ros-indigo/roslang
    ros-indigo/roscpp
    ros-indigo/genmsg
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
