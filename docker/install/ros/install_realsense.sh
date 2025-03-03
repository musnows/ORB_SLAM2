#!/usr/bin/env bash
# https://github.com/IntelRealSense/librealsense/blob/master/doc/installation_jetson.md
set -e

apt-get install -y cmake git 
apt-get install -y libusb-1.0-0-dev pkg-config \
    libglfw3-dev libgl1-mesa-dev libglu1-mesa-dev \
    openssl libssl-dev

# 克隆代码
git clone https://github.com/IntelRealSense/librealsense.git
pushd librealsense
    rm -rf build
    mkdir -p build && cd build
    # 使用RSUSB版本的后端
    cmake .. \
        -DBUILD_EXAMPLES=true \
        -DCMAKE_BUILD_TYPE=release \
        -DFORCE_RSUSB_BACKEND=ON
    make -j4
    make install
popd
