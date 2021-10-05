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

double current_value[MOTOR_COUNT] = {0, 0, 0, 0, 0, 0, 0};
double target_value[MOTOR_COUNT] = {0, 0, 0, 0, 0, 0, 0};
double active[MOTOR_COUNT] = {0, 0, 0, 0, 0, 0, 0};
double max_current[MOTOR_COUNT] = {0.155, 4.255, 2.195, 0.135, 0.652, 0.652, 2.120};

static const int period = 10; // [ms]
static const float step_size[MOTOR_COUNT] = {60.0*period, 100.0*period, 40.0*period, 60.0*period, 200.0*period, 200.0*period, 80.0*period};
static const float max_qc[MOTOR_COUNT] = {2*M_PI, 2*M_PI, 1000000000, 2*M_PI, 2*M_PI, 2*M_PI, 2*M_PI};
static const float min_qc[MOTOR_COUNT] = {-474270, 0, -1000000000, 0, 0, 0, 0};





void incremental_step_position_generator_callback(const xplore_msg::HandlingControl::ConstPtr& msg) {
	for(size_t it=0; it<MOTOR_COUNT; it++) {
		active[it] = msg->active[it];
	}
}

 void correct_target_values(vector<xcontrol::Epos4Extended*> chain) {

	for(size_t it=0; it<MOTOR_COUNT; ++it) {
		if(chain[it]->get_has_motor()) {
			if(target_value[it] > max_qc[it]) {
				cout << "Motor " << it << " target_value over limit: " << std::dec <<target_value[it] << " qc (max: " << max_qc[it] << ")\n";
				target_value[it] = max_qc[it];
			}
			if(target_value[it] < min_qc[it]) {
				cout << "Motor " << it << " target_value under limit: " << std::dec <<target_value[it] << " qc (min: " << min_qc[it] << ")\n";
				target_value[it] = min_qc[it];
			}
		}
	}
}


void reset_when_maxed() {
	
}

void reset_when_fault() {
	
}

int main(int argc, char **argv) {

	Epos4::control_mode_t control_mode(Epos4::position_CSP);
	//Epos4::control_mode_t control_mode(Epos4::profile_position_PPM);
	std::string network_interface_name("eth1");

	ros::init(argc, argv, "hd_controller_motors");
	ros::NodeHandle n;
	ros::Subscriber CS_HD_man_cmd_sub = n.subscribe<xplore_msg::HandlingControl>("cmd_hd", 10, incremental_step_position_generator_callback);
	

	cout << "ROS node initialized" << endl;

  	// Device definition
	// 3-axis: 1st slot next to ETHERNET-IN
	xcontrol::OneAxisSlot epos_1(true);
	xcontrol::ThreeAxisSlot epos_2(true), epos_3(true), epos_4(true);
	xcontrol::ThreeAxisSlot epos_5(true), epos_6(true), epos_7(true);

	vector<xcontrol::Epos4Extended*> chain = {&epos_1, &epos_2, &epos_3, &epos_4, &epos_5, &epos_6, &epos_7};

	bool is_scanning[MOTOR_COUNT] = {true, true, true, true, true, true, true};

	xcontrol::NetworkMaster ethercat_master(chain, network_interface_name);

	ethercat_master.init_network();

	cout << "Ethercat network online" << endl;

	high_resolution_clock::time_point time_point_start_loop;

	while(ros::ok()){ 
		
		// Get current time
		time_point_start_loop = high_resolution_clock::now();
		// check device status
		ethercat_master.switch_motors_to_enable_op();

		
			for(size_t it=0; it<MOTOR_COUNT; it++) {
				target_value[it] += active[it] * step_size[it];
			}

			for(size_t it=0; it<chain.size(); ++it) {

				if(chain[it]->get_has_motor()) {
					chain[it]->set_Control_Mode(control_mode);
					if (chain[it]->get_Device_State_In_String() == "Operation enable") {
						if (control_mode == Epos4::position_CSP) {
							if(PRINT_STATE) {
								cout << "Motor :" << it << "\n";
								cout << "Desired position value = " << std::dec <<target_value[it] << " qc" << "\n";
								
							}
							if(!is_scanning[it]) {
								//correct_target_values(chain);
								chain[it]->set_Target_Position_In_Qc(target_value[it]);
							}
						}
					}
				}
			}

		bool wkc = ethercat_master.next_Cycle(); // Function used to launch next cycle of the EtherCat net

		if (wkc == true) {
			for(size_t it=0; it<chain.size(); ++it) {
				if(chain[it]->get_has_motor()) {
					if(PRINT_STATE) {
						
						cout << "Motor " << it << "\n";
						cout << "State device : " << chain[it]->get_Device_State_In_String() << "\n";
						cout << "Control mode = " << chain[it]->get_Control_Mode_In_String() << "\n";
					
					}


					current_value[it] = chain[it]->get_Actual_Position_In_Qc();

					if(is_scanning[it]) {
						target_value[it] = current_value[it];
						is_scanning[it] = false;
					}

					if(PRINT_STATE) {
						
						cout << "Actual position : " << std::dec <<chain[it]->get_Actual_Position_In_Qc() << " qc" << "\n";
						cout << "Actual current value = " << chain[it]->get_Actual_Current_In_A() << "A" << "\n";
						cout << "\n";
						
					}
				}
			}
		} //end of valid workcounter

		high_resolution_clock::time_point time_point_end_loop = high_resolution_clock::now();

		ros::spinOnce();

		// Wait end of period
		this_thread::sleep_until(time_point_start_loop + chrono::milliseconds(period));
		duration<double> time_duration_loop = duration_cast<duration<double>>(time_point_end_loop - time_point_start_loop);
		// std::cout << "Time loop = " << time_duration_loop.count() << " seconds.\n";


		high_resolution_clock::time_point time_point_after_sleep_loop = high_resolution_clock::now();
		duration<double> time_duration_loop_after_sleep = duration_cast<duration<double>>(time_point_after_sleep_loop - time_point_start_loop);
		// std::cout << "Time loop after sleep = " << time_duration_loop_after_sleep.count() << " seconds.\n";

		if(PRINT_STATE) {
			cout << "\n" << endl;
		}
	}  

	cout << "End program" << endl;
	return 0;
}
