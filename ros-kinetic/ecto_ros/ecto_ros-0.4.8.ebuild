# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="A set of generic cells to interact with ROS"
HOMEPAGE="http://plasmodic.github.io/ecto_ros"
SRC_URI="https://github.com/ros-gbp/ecto_ros-release/archive/release/kinetic/ecto_ros/0.4.8-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/ecto
    ros-kinetic/message_generation
    ros-kinetic/geometry_msgs
    ros-kinetic/message_runtime
    ros-kinetic/rosbag
    ros-kinetic/roscpp
    ros-kinetic/std_msgs
    ros-kinetic/cv_bridge
    dev-cpp/eigen
"
DEPEND="${RDEPEND}
    ros-kinetic/cmake_modules
    ros-kinetic/nav_msgs
    ros-kinetic/sensor_msgs
    ros-kinetic/rosmsg
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
