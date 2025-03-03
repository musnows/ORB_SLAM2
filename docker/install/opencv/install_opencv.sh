#!/usr/bin/env bash

set -e

# 定义版本号变量
OPENCV_VERSION="3.2.0"

cd "$(dirname "${BASH_SOURCE[0]}")"

# 下载和解压
# wget -O opencv-${OPENCV_VERSION}.tar.gz https://github.com/opencv/opencv/archive/refs/tags/${OPENCV_VERSION}.tar.gz
tar -zxvf opencv-${OPENCV_VERSION}.tar.gz

# 开始编译和安装
pushd opencv-${OPENCV_VERSION}
    rm -rf build
    mkdir build && cd build 
    # 构建和编译安装
    cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local ..
    make -j$(nproc)
    make install
    # 刷新动态库
    ldconfig
    # 检测是否安装成功
    cd ../samples/cpp/example_cmake
    mkdir build && cd build 
    cmake ..
    make
popd

rm -rf opencv-${OPENCV_VERSION} opencv-${OPENCV_VERSION}.tar.gz