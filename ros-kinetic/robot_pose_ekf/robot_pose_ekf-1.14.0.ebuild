# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="The Robot Pose EKF package is used to estimate the 3D pose of a robot, based on "
HOMEPAGE="http://wiki.ros.org/robot_pose_ekf"
SRC_URI="https://github.com/ros-gbp/navigation-release/archive/release/kinetic/robot_pose_ekf/1.14.0-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/nav_msgs
    ros-kinetic/geometry_msgs
    ros-kinetic/roscpp
    ros-kinetic/std_msgs
    ros-kinetic/sensor_msgs
    ros-kinetic/rostest
    ros-kinetic/tf
    ros-kinetic/bfl
"
DEPEND="${RDEPEND}
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
