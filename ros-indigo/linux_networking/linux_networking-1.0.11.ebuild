# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="The linux_networking package"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/TheDash/linux_networking-release/archive/release/indigo/linux_networking/1.0.11-0.tar.gz"

LICENSE="TODO"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/network_monitor_udp
    ros-indigo/network_control_tests
    ros-indigo/ieee80211_channels
    ros-indigo/multi_interface_roam
    ros-indigo/asmach
    ros-indigo/access_point_control
    ros-indigo/network_detector
    ros-indigo/ddwrt_access_point
    ros-indigo/linksys_access_point
    ros-indigo/network_traffic_control
    ros-indigo/hostapd_access_point
    ros-indigo/asmach_tutorials
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
