/// following tutorial CH 3 https://www.youtube.com/watch?v=2FYm3GOonhk
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <iostream>

using namespace std;
using namespace cv;

//******************* crop and resize *****************************

int main(){

    string path = "Resources/test.png";
    Mat img = imread(path);
    Mat imgResize, imgResize2, imgCrop;
    
    resize(img,imgResize, img.size()+Size(200,200));            //definite pixels
    resize(img,imgResize2, Size(),0.5,0.5);                     //scale factor 0.5
    
    Rect roi(100,100,300,250);                                  //region of interest
    imgCrop = img(roi);

    imshow("image", img);
    imshow("imageResized",imgResize);
    imshow("crop",imgCrop);

    waitKey(0);
    return 0;
}