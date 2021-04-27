# Install script for directory: /media/xplore/etienne_vol/Xplore/HD_workspace/src/Inverse_kinematics_robotic_arm/testarm/HD15

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/media/xplore/etienne_vol/Xplore/HD_workspace/build/Inverse_kinematics_robotic_arm/testarm/HD15/catkin_generated/installspace/HD15.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/HD15/cmake" TYPE FILE FILES
    "/media/xplore/etienne_vol/Xplore/HD_workspace/build/Inverse_kinematics_robotic_arm/testarm/HD15/catkin_generated/installspace/HD15Config.cmake"
    "/media/xplore/etienne_vol/Xplore/HD_workspace/build/Inverse_kinematics_robotic_arm/testarm/HD15/catkin_generated/installspace/HD15Config-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/HD15" TYPE FILE FILES "/media/xplore/etienne_vol/Xplore/HD_workspace/src/Inverse_kinematics_robotic_arm/testarm/HD15/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/HD15/config" TYPE DIRECTORY FILES "/media/xplore/etienne_vol/Xplore/HD_workspace/src/Inverse_kinematics_robotic_arm/testarm/HD15/config/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/HD15/launch" TYPE DIRECTORY FILES "/media/xplore/etienne_vol/Xplore/HD_workspace/src/Inverse_kinematics_robotic_arm/testarm/HD15/launch/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/HD15/meshes" TYPE DIRECTORY FILES "/media/xplore/etienne_vol/Xplore/HD_workspace/src/Inverse_kinematics_robotic_arm/testarm/HD15/meshes/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/HD15/urdf" TYPE DIRECTORY FILES "/media/xplore/etienne_vol/Xplore/HD_workspace/src/Inverse_kinematics_robotic_arm/testarm/HD15/urdf/")
endif()

