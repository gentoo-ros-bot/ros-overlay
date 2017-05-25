# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="This package provides a C++ interface for camera calibration
     information.  It provides CameraInfo, and handles SetCameraInfo
     service requests, saving and restoring the camera calibration
     data."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-gbp/image_common-release/archive/release/lunar/camera_info_manager/1.11.12-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-lunar/roscpp
    ros-lunar/roslib
    ros-lunar/sensor_msgs
    ros-lunar/image_transport
    ros-lunar/camera_calibration_parsers
    boost
"
DEPEND="
    ros-lunar/roscpp
    ros-lunar/roslib
    ros-lunar/sensor_msgs
    ros-lunar/image_transport
    ros-lunar/rostest
    ros-lunar/camera_calibration_parsers
    boost
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