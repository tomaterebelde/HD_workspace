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

#include <stdio.h>
#include <termio.h>
#include <signal.h>


using namespace std;
using namespace std::chrono;

static const int rate = 1; // [1/ms]

static const double demi_period = rate;

#define PI 3.14159265

int getch()
{
  static struct termios oldt, newt;
  tcgetattr( STDIN_FILENO, &oldt);           // save old settings
  newt = oldt;
  newt.c_lflag &= ~(ICANON);                 // disable buffering      
  tcsetattr( STDIN_FILENO, TCSANOW, &newt);  // apply new settings

  int c = getchar();  // read character (non-blocking)

  tcsetattr( STDIN_FILENO, TCSANOW, &oldt);  // restore old settings
  return c;
}

int main(int argc, char **argv){

	ros::init(argc, argv, "manual_increment_position_generator");
	ros::NodeHandle n;

    ros::Publisher position_generator_pub = n.advertise<xplore_msg::HandlingControl>("manual_increment_motor_position_generator", 1000);

    int index = -1;
    int in_index = -1;
    int val[7] = {0, 0, 0, 0, 0, 0, 0};

    while (ros::ok()) {
        int c = getch();   // call your non-blocking input function
        if(index == -1 && (c <= '7' && c >= '1')) {
            in_index = c - '0' - 1;
        }

        if(index != -1 && (c == '-' || c == '+' || c == '/')) {
            if(c == '-') {
                val[index] = -1;
            } else if(c == '+') {
                val[index] = 1;
            } else if(c == '/') {
                val[index] = 0;
            }

        }        

        if (c == 10) {
            if(index == -1 && in_index != -1) {
                index = in_index;
            } else {
                xplore_msg::HandlingControl msg;

                for(size_t it=0; it<7; ++it) {
                    msg.active[it] = val[it];
                }

                position_generator_pub.publish(msg);

                cout << "message sent with values: \n";
                for(size_t it=0; it<7; ++it) {
                    cout << "   " << it+1 << " : " << std::dec << val[it] << "\n";
                }

                index = -1;
            }
        }

        ros::spinOnce();
    }

	return 0;
}
