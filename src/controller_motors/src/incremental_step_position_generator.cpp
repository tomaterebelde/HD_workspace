#include <xplore_msg/HandlingControl.h>
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
#include <math.h>

using namespace std;
using namespace std::chrono;

static const int rate = 1; // [1/ms]

static const double demi_period = rate;

#define PI 3.14159265

int main(int argc, char **argv){

	ros::init(argc, argv, "incremental_step_position_generator");
	ros::NodeHandle n;

    ros::Publisher position_generator_pub = n.advertise<xplore_msg::HandlingControl>("cmd_hd", 1000);

    ros::Rate loop_rate(rate);

    float val = 1;
    int dir = 1;

    int count = 0;
    while (ros::ok())
    {
        xplore_msg::HandlingControl msg;
        if(count == demi_period) {
            count = 0;
            if((val == 1 && dir == 1) || (val = -1 && dir ==-1)) {
                dir = -dir;
            }
            val += dir;
        }

        for(size_t it=0; it<6; it++) {
            msg.active[it] = val;
        }

        position_generator_pub.publish(msg);

        cout << "message sent\n";

        ros::spinOnce();

        loop_rate.sleep();
        ++count;
    }

	return 0;
}
