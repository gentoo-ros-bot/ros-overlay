# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="A set of plugins for displaying occupancy information decoded from binary octoma"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-gbp/octomap_rviz_plugins-release/archive/release/indigo/octomap_rviz_plugins/0.0.5-1.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/rviz
    ros-indigo/roscpp
    ros-indigo/octomap_msgs
    ros-indigo/octomap
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
