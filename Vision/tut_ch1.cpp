/// following tutorial CH 1 https://www.youtube.com/watch?v=2FYm3GOonhk
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <iostream>

using namespace std;
using namespace cv;

//******************* importing images *****************************
/*
int main(){

    string path = "Resources/test.png";
    Mat img = imread(path);
    imshow("Image",img);
    waitKey(0);                             // time to wait between frames in ms (larger = slower), 0 waits until window closed
    }
    return 0;
}*/

//******************* importing video *****************************
/*
int main(){

    string path = "Resources/test_video.mp4";
    VideoCapture cap(path);
    Mat img;
    while(true){
        cap.read(img);
        imshow("Image",img);
        waitKey(1);                         // time to wait between frames in ms (larger = slower)
    }
    
    
    return 0;
}*/

//******************* webcam *****************************

int main(){

    VideoCapture cap(0);
    int i = 5;
    while(i-->0){
    if(!cap.isOpened()){
        cout << "cannot open camera" << endl;
    }
    //return -1;
    }
    Mat img;

    while(true){
        cap.read(img);
        imshow("image",img);
        waitKey(10);
    }
 
    
    return 0;
}
