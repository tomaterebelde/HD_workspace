# Install script for directory: /media/xplore/etienne_vol/Xplore/HD_workspace/src/Inverse_kinematics_robotic_arm/testarm/hd_ik_cmd

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/media/xplore/etienne_vol/Xplore/HD_workspace/build/Inverse_kinematics_robotic_arm/testarm/hd_ik_cmd/catkin_generated/installspace/hd_ik_cmd.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hd_ik_cmd/cmake" TYPE FILE FILES
    "/media/xplore/etienne_vol/Xplore/HD_workspace/build/Inverse_kinematics_robotic_arm/testarm/hd_ik_cmd/catkin_generated/installspace/hd_ik_cmdConfig.cmake"
    "/media/xplore/etienne_vol/Xplore/HD_workspace/build/Inverse_kinematics_robotic_arm/testarm/hd_ik_cmd/catkin_generated/installspace/hd_ik_cmdConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hd_ik_cmd" TYPE FILE FILES "/media/xplore/etienne_vol/Xplore/HD_workspace/src/Inverse_kinematics_robotic_arm/testarm/hd_ik_cmd/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/hd_ik_cmd/move_group_cmd" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/hd_ik_cmd/move_group_cmd")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/hd_ik_cmd/move_group_cmd"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/hd_ik_cmd" TYPE EXECUTABLE FILES "/media/xplore/etienne_vol/Xplore/HD_workspace/devel/lib/hd_ik_cmd/move_group_cmd")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/hd_ik_cmd/move_group_cmd" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/hd_ik_cmd/move_group_cmd")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/hd_ik_cmd/move_group_cmd"
         OLD_RPATH "/opt/ros/melodic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/hd_ik_cmd/move_group_cmd")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hd_ik_cmd" TYPE DIRECTORY FILES "/media/xplore/etienne_vol/Xplore/HD_workspace/src/Inverse_kinematics_robotic_arm/testarm/hd_ik_cmd/launch" REGEX "/setup\\_assistant\\.launch$" EXCLUDE)
endif()

