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

	ros::init(argc, argv, "manual_position_generator");
	ros::NodeHandle n;

    ros::Publisher position_generator_pub = n.advertise<std_msgs::Float32>("manual_motor_position_generator", 1000);

    float val = 0;

    while (ros::ok()) {
        int c = getch();   // call your non-blocking input function
        if(c <= '9' && c >= '0') {
            val = 10*val + c - '0';
        }

        cout << "character: " << c << "\n";

        if (c == 10) {
            std_msgs::Float32 msg;

            msg.data = val;

            position_generator_pub.publish(msg);

            cout << "message sent with value: " << val << "\n";

            val = 0;
        }

        ros::spinOnce();
    }

	return 0;
}
