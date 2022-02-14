/// following tutorial CH 4 https://www.youtube.com/watch?v=2FYm3GOonhk
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <iostream>

using namespace std;
using namespace cv;

//******************* Drawing Text and Shapes *****************************

int main(){

//blank image
    Mat img(512,512, CV_8UC3, Scalar(255,255,255));
    
    circle(img, Point(256,256),155,Scalar(4,200,69),FILLED);   //where its drawn, center point, radius, color of line, line thickness or FILLED
    Rect rec(100,100,50,100);
    rectangle(img,rec,Scalar(255,0,0),10);
    rectangle(img,Point(200,250),Point(250,300),Scalar(255,255,0),FILLED);
    line(img, Point(400,200),Point(400,500),Scalar(0,0,0),5);

    putText(img,"hello", Point(200,400),FONT_HERSHEY_SIMPLEX,2,Scalar(255,65,30),2);

    imshow("image",img);
    waitKey(0);
    return 0;
}