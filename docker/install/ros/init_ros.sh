# NOTE: can't write file while docker build
# ros init
echo "[ROS] rosdep init && rosdep updage"
echo "185.199.109.133 raw.githubusercontent.com" >> /etc/hosts # fix dns error
rosdep init
rosdep update

# active
echo "[ROS] add setup.bash to .bashrc"
echo "source /opt/ros/melodic/setup.bash" >> $HOME/.bashrc
source ~/.bashrc
