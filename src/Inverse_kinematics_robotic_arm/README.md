## Inverse_kinematics_robotic_arm

To visualize the robotic arm in rviz and manually select the start and goal positions for motion planning, run
```
roslaunch HD15_IK demo.launch 
```
Run the following commands to set the specific position and orientation of the end-effector
```
rostopic pub /direion geometry_msgs/Pose "position: x:0.2 y:0.3 z:0.4 orientation: x:1 y:1 z:1 w:1" 
```
and open another tab to run the subscriber for topic /direction messsage /geometry_msgs
```
rosrun hd_ik_cmd move_group_cmd 
```
Open another tab to see the positions of each joint, and we shall subscribe the topic with joint_states in hardware interface 
```
rostopic echo /joint_states
```
