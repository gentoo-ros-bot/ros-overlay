# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Baxter-specific programs for Amazon Robotics Challenge 2017 at JSK Lab."
HOMEPAGE="http://wiki.ros.org/jsk_arc2017_baxter"
SRC_URI="https://github.com/tork-a/jsk_apc-release/archive/release/indigo/jsk_arc2017_baxter/3.0.3-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/jsk_arc2017_common
    ros-indigo/jsk_interactive_marker
    ros-indigo/jsk_2015_05_baxter_apc
    ros-indigo/jsk_rviz_plugins
    ros-indigo/jsk_baxter_startup
    ros-indigo/rospy
    ros-indigo/xacro
    ros-indigo/jsk_rqt_plugins
    ros-indigo/jsk_data
    ros-indigo/jsk_perception
    ros-indigo/jsk_topic_tools
    ros-indigo/jsk_apc2015_common
    ros-indigo/robot_state_publisher
    ros-indigo/jsk_recognition_utils
    ros-indigo/jsk_apc2016_common
    ros-indigo/jsk_2016_01_baxter_apc
"
DEPEND="${RDEPEND}
    ros-indigo/roseus
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
