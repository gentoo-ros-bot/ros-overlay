# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="A set of tools and interfaces extending the capabilities of c++ to 
    provide "
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/yujinrobot-release/ecl_core-release/archive/release/kinetic/ecl_core/0.61.17-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/ecl_concepts
    ros-kinetic/ecl_converters
    ros-kinetic/ecl_sigslots
    ros-kinetic/ecl_containers
    ros-kinetic/ecl_streams
    ros-kinetic/ecl_utilities
    ros-kinetic/ecl_linear_algebra
    ros-kinetic/ecl_statistics
    ros-kinetic/ecl_ipc
    ros-kinetic/ecl_devices
    ros-kinetic/ecl_geometry
    ros-kinetic/ecl_formatters
    ros-kinetic/ecl_math
    ros-kinetic/ecl_time
    ros-kinetic/ecl_eigen
    ros-kinetic/ecl_threads
    ros-kinetic/ecl_exceptions
    ros-kinetic/ecl_command_line
    ros-kinetic/ecl_mpl
    ros-kinetic/ecl_core_apps
    ros-kinetic/ecl_type_traits
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
