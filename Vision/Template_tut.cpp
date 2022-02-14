/// following tutorial CH _ https://www.youtube.com/watch?v=2FYm3GOonhk
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <iostream>

using namespace std;
using namespace cv;

//******************* _____ *****************************

int main(){

    string path = "Resources/test.png";
    Mat img = imread(path);
    
    imshow("image",img);
    waitKey(0);
    return 0;
}