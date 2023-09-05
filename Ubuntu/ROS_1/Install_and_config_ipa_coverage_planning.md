# Install packages
```
sudo apt install coinor-libcoinutils-dev coinor-libclp-dev coinor-libcbc-dev
sudo apt install ros-$(rosversion -d)-opengm
sudo apt install ros-$(rosversion -d)-libdlib
sudo apt install ros-$(rosversion -d)-cob-navigation
```

# Clone repository and make 
```
mkdir -p catkin_ws/src && cd catkin_ws/src
git clone https://github.com/ipa320/ipa_coverage_planning.git
cd ../..
catkin_make
```

# Run demo

### For Terminal 1
```
roscore
```
### For Terminal 2

```
source ./devel/setup.bash
```

#### Method 1
```
rosrun ipa_room_exploration room_exploration_server
```
#### Method 2
```
roslaunch ipa_room_exploration room_exploration_action_server.launch
```

### For Terminal 3

```
source ./devel/setup.bash
```

#### Method 1
```
rosrun ipa_room_exploration room_exploration_client
```

#### Method 2
```
roslaunch ipa_room_exploration room_exploration_client.launch robot_env:=sample_warehouse use_test_maps:=false
```
