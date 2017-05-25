# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="effort_controllers"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-gbp/ros_controllers-release/archive/release/lunar/effort_controllers/0.12.3-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-lunar/controller_interface
    ros-lunar/forward_command_controller
    ros-lunar/urdf
    ros-lunar/realtime_tools
    ros-lunar/control_msgs
    ros-lunar/angles
    ros-lunar/control_toolbox
"
DEPEND="
    ros-lunar/controller_interface
    ros-lunar/forward_command_controller
    ros-lunar/urdf
    ros-lunar/realtime_tools
    ros-lunar/control_msgs
    ros-lunar/angles
    ros-lunar/control_toolbox
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