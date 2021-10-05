#include <xplore_msg/HandlingControl.h>
#include <sensor_msgs/JointState.h>
#include <std_msgs/Float32.h>
#include "ros/ros.h"
#include <std_msgs/String.h>
#include <std_msgs/Int32.h>
#include <std_msgs/UInt8MultiArray.h>
#include <string>
#include "message_filters/subscriber.h"
#include "message_filters/time_synchronizer.h"
#include "message_filters/cache.h"
#include <iostream>
#include <chrono>
#include <thread>
#include <pthread.h>
#include <sys/mman.h>
#include <pid/signal_manager.h>
#include <math.h>
#include <xcontrol/network_master.h>
#include <xcontrol/one_axis_slot.h>
#include <xcontrol/three_axis_slot.h>

using namespace std;
using namespace std::chrono;
using namespace ethercatcpp;
using namespace pid;
using namespace xcontrol;
using namespace message_filters;
using namespace sensor_msgs;

#define MOTOR_COUNT 7
#define PRINT_STATE true

static const int period = 10; // [ms]


static std_msgs::Int32 CS_confirmation_msg;
static std_msgs::Int32 CS_completion_msg;
static ros::Publisher CS_confirmation;
static ros::Publisher CS_completion;


void CS_state_callback(const std_msgs::UInt8MultiArray::ConstPtr& msg) {
	
	if(msg->data[0] == 2) { //Maintenance automatic task
		switch(msg->data[1]) { 
			case 1:	//Work
				CS_confirmation_msg.data = 1;
				break;

			case 2://Wait
				CS_confirmation_msg.data = 1;
				break;

			case 3://Stop
				CS_confirmation_msg.data = 1;
				break;

			case 4://Resume
				CS_confirmation_msg.data = 1;
				break;
			
			default:
				CS_confirmation_msg.data = 0;
				break;
		}
		CS_confirmation.publish(CS_confirmation_msg);
		

	}

	else if(msg->data[0] == 3) { //Science automatic Task
		switch(msg->data[1]) { 
			case 1:	//Work
				CS_confirmation_msg.data = 1;
				break;

			case 2://Wait
				CS_confirmation_msg.data = 1;
				break;

			case 3://Stop
				CS_confirmation_msg.data = 1;
				break;

			case 4://Resume
				CS_confirmation_msg.data = 1;
				break;
			
			default:
				CS_confirmation_msg.data = 0;
				break;
		}
		CS_confirmation.publish(CS_confirmation_msg);

	}

	else if(msg->data[0] == 4) { //Probing automatic Task
		switch(msg->data[1]) { 
			case 1:	//Work
				CS_confirmation_msg.data = 1;
				break;

			case 2://Wait
				CS_confirmation_msg.data = 1;
				break;

			case 3://Stop
				CS_confirmation_msg.data = 1;
				break;

			case 4://Resume
				CS_confirmation_msg.data = 1;
				break;
			
			default:
				CS_confirmation_msg.data = 0;
				break;
		}
		CS_confirmation.publish(CS_confirmation_msg);
	}
	
}


int main(int argc, char **argv) {

	ros::init(argc, argv, "hd_controller_motors");
	ros::NodeHandle n;
	ros::Subscriber CS_state_sub = n.subscribe<std_msgs::UInt8MultiArray>("state", 10, CS_state_callback);
	CS_confirmation = n.advertise<std_msgs::Int32>("confirmation", 10);
	CS_completion = n.advertise<std_msgs::Int32>("completed", 10);



	cout << "ROS node initialized" << endl;

	while(ros::ok()){ 
		

		ros::spinOnce();

	}  

	cout << "End program" << endl;
	return 0;
}
