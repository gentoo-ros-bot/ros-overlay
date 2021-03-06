# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Driver module between Aldebaran's NAOqiOS and ROS. It publishes all sensor and a"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-naoqi/naoqi_driver-release/archive/release/indigo/naoqi_driver/0.5.9-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/rosbag_storage
    ros-indigo/image_transport
    ros-indigo/naoqi_libqicore
    ros-indigo/tf2_ros
    ros-indigo/orocos_kdl
    ros-indigo/naoqi_bridge_msgs
    ros-indigo/naoqi_libqi
    ros-indigo/robot_state_publisher
    ros-indigo/kdl_parser
    ros-indigo/cv_bridge
    dev-libs/boost
"
DEPEND="${RDEPEND}
    ros-indigo/tf2_geometry_msgs
    ros-indigo/geometry_msgs
    ros-indigo/diagnostic_msgs
    ros-indigo/tf2_msgs
    ros-indigo/diagnostic_updater
    ros-indigo/sensor_msgs
    ros-indigo/rosgraph_msgs
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
