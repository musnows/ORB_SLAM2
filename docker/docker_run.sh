#!/usr/bin/env bash

# 将上两级目录映射到docker容器内，方便使用
HOME_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../.." && pwd )"

display=""
if [ -z ${DISPLAY} ];then
    display=":1"
else
    display="${DISPLAY}"
fi

local_host="$(hostname)"
user="${USER}"
uid="$(id -u)"
group="$(id -g -n)"
gid="$(id -g)"

# echo "[RUN] stop and rm docker" 
# docker stop orbslam2 > /dev/null
# docker rm -v -f orbslam2 > /dev/null

echo "[RUN] create docker"
docker run -it -d \
    --name orbslam2 \
    -e DISPLAY=$display \
    --privileged=true \
    -e DOCKER_USER="${user}" \
    -e USER="${user}" \
    -e DOCKER_USER_ID="${uid}" \
    -e DOCKER_GRP="${group}" \
    -e DOCKER_GRP_ID="${gid}" \
    -e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR \
    -v ${HOME_DIR}:/work \
    -v ${XDG_RUNTIME_DIR}:${XDG_RUNTIME_DIR} \
    --net host \
    orbslam2:latest
