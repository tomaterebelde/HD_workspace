#include <opencv2/aruco.hpp>
#include <opencv2/highgui.hpp>

using namespace cv ;
using namespace cv::aruco ;

int main() {


    Mat markerImage;
    Ptr<Dictionary> dictionary = getPredefinedDictionary(DICT_6X6_250);
    drawMarker(dictionary, 23, 200, markerImage, 1);
    
    imwrite("marker23.png", markerImage);

    return 0;
}