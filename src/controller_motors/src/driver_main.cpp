#include <sensor_msgs/JointState.h>
#include <std_msgs/Float32.h>
#include "ros/ros.h"
#include "std_msgs/String.h"
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

Epos4::control_mode_t control_mode;
std::string network_interface_name;
double target_value[6] = {0, 0, 0, 0, 0, 0};

static const int period = 1; // [ms]

void position_generator_callback(const std_msgs::Float32::ConstPtr& msg) {
	cout << "target value modified\n";
	target_value[0] = msg->data;
}

void inverse_kinematics_callback(const sensor_msgs::JointState::ConstPtr& msg){
	/*
	* whenever a message of type WheelVeloicity is published on the /wheel_publisher topic
	* this callback is called
	*
	* wheel_callback updates the values of the target_value array which contains the reference 
	* individual wheel speeds expressed in RPMs
	*/
	target_value[0] = msg->position[0];
	target_value[1] = msg->position[1];
	target_value[2] = msg->position[2];
	target_value[3] = msg->position[3];
	target_value[4] = msg->position[4];
	target_value[5] = msg->position[5];
}

int main(int argc, char **argv){

	ros::init(argc, argv, "controller_motors");
	ros::NodeHandle n;
	// ros::Subscriber sub = n.subscribe<sensor_msgs::JoinState>("TOPIC NAME", 10, inverse_kinematics_callback);

	ros::Subscriber sub = n.subscribe<std_msgs::Float32>("motor_position_generator", 10, position_generator_callback);

	cout << "ROS node initialized" << endl;

	network_interface_name = "eth1";
	std::string input_target = "0";
	for(size_t i=0; i<3; i++) {
		target_value[i] = atof(input_target.c_str());
	}

	// control_mode = Epos4::position_CSP;
    // control_mode = Epos4::velocity_CSV;
    // control_mode = Epos4::torque_CST;
    control_mode = Epos4::profile_position_PPM;

  	// Device definition
	xcontrol::OneAxisSlot epos_1(true);

	vector<xcontrol::Epos4Extended*> chain = {&epos_1};

	xcontrol::NetworkMaster ethercat_master(chain, network_interface_name);

	ethercat_master.init_network();

	cout << "Ethercat network online" << endl;

	high_resolution_clock::time_point time_point_start_loop;

	while(ros::ok()){ 
		// Get current time
		time_point_start_loop = high_resolution_clock::now();
		// check device status
		ethercat_master.switch_motors_to_enable_op();

		for(size_t it=0; it<chain.size(); ++it) {
			chain[it]->set_Control_Mode(control_mode);

			if (chain[it]->get_Device_State_In_String() == "Operation enable") {
				if (control_mode == Epos4::position_CSP) {
					chain[it]->set_Target_Position_In_Qc(target_value[it]);
					cout << "Desired position value = " << std::dec <<target_value[it] << " qc" << "\n";
				} else if (control_mode == Epos4::velocity_CSV) {
					chain[it]->set_Target_Velocity_In_Rpm(target_value[it]);
					cout << "Desired velocity value = " << std::dec <<target_value[it] << " rpm" << "\n";
				} else if (control_mode == Epos4::torque_CST) {
					chain[it]->set_Target_Torque_In_Nm(target_value[it]);
					cout << "Desired target value = " << std::dec <<target_value[it] << " Nm"<< "\n";
				}

				if (control_mode == Epos4::profile_position_PPM) {
					// unlock axle
					chain[it]->halt_Axle(false);
					// Starting new positionning at receive new order (or wait finish before start new with "false state")
					chain[it]->change_Starting_New_Pos_Config(true);
					// normal mode (not in endless)
					chain[it]->active_Endless_Movement(false);

					// chain[it]->active_Absolute_Positionning();
					chain[it]->active_Relative_Positionning();

					if (!(chain[it]->get_Device_State_In_String() == "Operation enable")) {
						chain[it]->activate_Profile_Control(false);
					} else {
						cout << "************************************** \n";
						chain[it]->activate_Profile_Control(true);
						chain[it]->set_Target_Position_In_Qc(target_value[it]);
						cout << "Desired position value = " << std::dec <<target_value[it] << " qc" << "\n";
					}
				}
			}
		}


		bool wkc = ethercat_master.next_Cycle(); // Function used to launch next cycle of the EtherCat net

		if (wkc == true) {
			for(Epos4* epos: chain) {
				cout << "State device : " << epos->get_Device_State_In_String() << "\n";
				cout << "Control mode = " << epos->get_Control_Mode_In_String() << "\n";

				cout << "Actual position : " << std::dec <<epos->get_Actual_Position_In_Qc() << " qc" << "\n";

				// Specific for PPM mode
				if (control_mode == Epos4::profile_position_PPM){
					cout << "Target is reached : " << epos->check_target_reached() << "\n";
				}
			}
		} //end of valid workcounter

		high_resolution_clock::time_point time_point_end_loop = high_resolution_clock::now();

		ros::spinOnce();

		// Wait end of period
		this_thread::sleep_until(time_point_start_loop + chrono::milliseconds(period));
		duration<double> time_duration_loop = duration_cast<duration<double>>(time_point_end_loop - time_point_start_loop);
		std::cout << "Time loop = " << time_duration_loop.count() << " seconds.\n";


		high_resolution_clock::time_point time_point_after_sleep_loop = high_resolution_clock::now();
		duration<double> time_duration_loop_after_sleep = duration_cast<duration<double>>(time_point_after_sleep_loop - time_point_start_loop);
		std::cout << "Time loop after sleep = " << time_duration_loop_after_sleep.count() << " seconds.\n";

		cout << "\n\n\n" << endl;
	}  

	cout << "End program" << endl;
	return 0;
}
