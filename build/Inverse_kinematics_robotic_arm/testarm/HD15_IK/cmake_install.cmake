# Install script for directory: /media/xplore/etienne_vol/Xplore/HD_workspace/src/Inverse_kinematics_robotic_arm/testarm/HD15_IK

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/media/xplore/etienne_vol/Xplore/HD_workspace/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/media/xplore/etienne_vol/Xplore/HD_workspace/build/Inverse_kinematics_robotic_arm/testarm/HD15_IK/catkin_generated/installspace/HD15_IK.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/HD15_IK/cmake" TYPE FILE FILES
    "/media/xplore/etienne_vol/Xplore/HD_workspace/build/Inverse_kinematics_robotic_arm/testarm/HD15_IK/catkin_generated/installspace/HD15_IKConfig.cmake"
    "/media/xplore/etienne_vol/Xplore/HD_workspace/build/Inverse_kinematics_robotic_arm/testarm/HD15_IK/catkin_generated/installspace/HD15_IKConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/HD15_IK" TYPE FILE FILES "/media/xplore/etienne_vol/Xplore/HD_workspace/src/Inverse_kinematics_robotic_arm/testarm/HD15_IK/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/HD15_IK" TYPE DIRECTORY FILES "/media/xplore/etienne_vol/Xplore/HD_workspace/src/Inverse_kinematics_robotic_arm/testarm/HD15_IK/launch" REGEX "/setup\\_assistant\\.launch$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/HD15_IK" TYPE DIRECTORY FILES "/media/xplore/etienne_vol/Xplore/HD_workspace/src/Inverse_kinematics_robotic_arm/testarm/HD15_IK/config")
endif()

