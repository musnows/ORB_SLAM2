#!/usr/bin/env bash

echo "[INTO] docker start"
docker start orbslam2

echo "[INTO] docker exec /bin/bash"
xhost +local:root 1>/dev/null 2>&1
docker exec \
    -u root \
    -it orbslam2 \
    /bin/bash
xhost -local:root 1>/dev/null 2>&1
