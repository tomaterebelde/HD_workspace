# Setup 
# Initial setup (Do once)

We'll assume you have ROS melodic already installed and setup on your machine. Don't forget to do:
```bash
source /opt/ros/melodic/setup.bash
```
If not already present in your `~/.bashrc`.

```bash 
sudo apt-get install ros-melodic-moveit
sudo apt-get install ros-melodic-moveit-visual-tools
sudo apt-get install ros-melodic-rviz-visual-tools
```

# To run the driver node

```bash
cd <workspace>
catkin_make
```

In another terminal, type
```bash
sudo -i
cd <workspace>
source devel/setup.sh
rosrun hd_controller_motors hd_controller_motors
```
