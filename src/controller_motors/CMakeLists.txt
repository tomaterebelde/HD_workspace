cmake_minimum_required(VERSION 3.0.2)
project(hd_controller_motors)


find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  sensor_msgs
  message_filters
  message_generation
)


generate_messages(
  DEPENDENCIES
  std_msgs
)

 
catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES sync
  CATKIN_DEPENDS rospy roscpp message_runtime
#  DEPENDS system_lib
)


include_directories(
# include
  ${catkin_INCLUDE_DIRS}
  ${PROJECT_SOURCE_DIR}/include
)

message(STATUS "DIR : --------->  ${PROJECT_SOURCE_DIR}")


add_executable(hd_controller_motors src/driver_main.cpp)

target_link_libraries(hd_controller_motors ${catkin_LIBRARIES} 
                      ${PROJECT_SOURCE_DIR}/lib/libethercatcpp-core_ethercatcpp-core.so 
                      ${PROJECT_SOURCE_DIR}/lib/libethercatcpp-epos_ethercatcpp-epos.so 
                      ${PROJECT_SOURCE_DIR}/lib/libpid-os-utilities_pid-signal-manager.so 
                      ${PROJECT_SOURCE_DIR}/lib/libsoem.a 
		      ${PROJECT_SOURCE_DIR}/lib/libxcontrol_xcontrol.so)

# add_dependencies(hd_controller_motors controller_motors_generate_messages_cpp)

