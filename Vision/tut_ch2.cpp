/// following tutorial CH 2 https://www.youtube.com/watch?v=2FYm3GOonhk
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <iostream>

using namespace std;
using namespace cv;

//******************* basic Functions *****************************

int main(){

    string path = "Resources/test.png";
    Mat img = imread(path);
    Mat imgGray,imgBlur,imgCanny,imgDil,imgErode;
    cvtColor(img,imgGray,COLOR_BGR2GRAY);
    GaussianBlur(imgGray,imgBlur, Size(5,5),5,0); // blurs image
    Canny(imgBlur,imgCanny,25,150);         //Edge detection

    Mat kernal = getStructuringElement(MORPH_RECT,Size(5,5)); //determines how dilation occurs. use only ODD numbers?
    dilate(imgCanny, imgDil, kernal);                         //inflates edges
    erode(imgDil,imgErode,kernal);
    
    
    imshow("Image",img);
    imshow("imgGray", imgGray);
    imshow("blur",imgBlur);
    imshow("edges", imgCanny);
    imshow("dialation", imgDil);
    imshow("erode",imgErode);
    waitKey(0);                             // time to wait between frames in ms (larger = slower), 0 waits until window closed
    return 0;
}