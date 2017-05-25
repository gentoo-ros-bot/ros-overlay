# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Components of MoveIt that offer simpler interfaces to planning and execution"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-gbp/moveit-release/archive/release/lunar/moveit_ros_planning_interface/0.9.6-1.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-lunar/rosconsole
    ros-lunar/roscpp
    ros-lunar/actionlib
    ros-lunar/moveit_ros_warehouse
    ros-lunar/moveit_ros_move_group
    ros-lunar/eigen_conversions
    ros-lunar/moveit_ros_planning
    ros-lunar/rospy
    ros-lunar/tf
    ros-lunar/moveit_ros_manipulation
    ros-lunar/tf_conversions
    python
"
DEPEND="
    ros-lunar/rosconsole
    ros-lunar/roscpp
    ros-lunar/actionlib
    ros-lunar/moveit_ros_warehouse
    ros-lunar/moveit_ros_move_group
    ros-lunar/eigen_conversions
    ros-lunar/moveit_ros_planning
    ros-lunar/rospy
    ros-lunar/tf
    ros-lunar/moveit_ros_manipulation
    ros-lunar/tf_conversions
    python
    eigen
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo

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
    echo ""
}

pkg_postinst() {
    cd ../work
    source /opt/ros/lunar/setup.bash
    catkin_make_isolated --install --install-space="/opt/ros/lunar" || die
}