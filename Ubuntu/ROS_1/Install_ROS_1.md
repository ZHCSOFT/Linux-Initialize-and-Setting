Ubuntu latest supported version: 20.04

```
cd ~/Downloads
wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc
sudo apt-key add ros.asc
```

```
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
```

```
sudo apt update && sudo apt install ros-noetic-desktop-full
```

```
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
```
