#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <iostream>

using namespace std;
using namespace cv;

int main(){
// need to configure ffmpeg??????**************************
    VideoCapture cap(0);
    cout << "cap" << endl;
    if(!cap.isOpened()){
        cout << "Error opening video stream" << endl;
        return -1;
    }

    while(1){

        Mat img;
        cap >> img;

        if(img.empty())
            break;
        imshow("frame",img);
        waitKey(1);
    }
    return 0;

}