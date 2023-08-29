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
