# include <opencv2/aruco.hpp>
# include <opencv2/highgui.hpp>
# include <opencv2/imgproc.hpp>
# include <opencv2/imgcodecs.hpp>
#include <opencv2/videoio.hpp>
#include <opencv2/opencv.hpp>
# include <vector>
# include <iostream>
#include <cstdlib>
#include <unistd.h>
#include <string>



using namespace cv;
using namespace std;
using namespace cv::aruco;

// add the polynomial obtained with the matlab polyfit//
 //y= 0.002929 *x^2 -2.239*x + 527.2 where x is the size in pixels and y the distance etimate

int main( int argc, const char** argv ){
    Ptr<Dictionary> dictionary = getPredefinedDictionary(DICT_7X7_250);// will need to redifine the dict for the competition
    VideoCapture input_vid(0);
    //input_vid.set(CAP_PROP_AUTOFOCUS, 0);
    //input_vid.set(3,1280);     // not sure what those 2 lines do
    //input_vid.set(4,720);
    if(!input_vid.isOpened()){
        cerr << "No camera detected on this system" << endl;
        return -1;
    }
    Mat image, imageCopy;
    while(true){
        input_vid >> image;
        //if(image.empty()){
        //    cerr << "Frame invalid and skipped!" << endl;
        //    continue;
        //}
        imshow("camera view", image);  //show live camera feed

        image.copyTo(imageCopy);
        vector<int> ids;
        vector<vector<Point2f> > corners;  //each tag has 4 courners each corner is a 2d points so we get a vector vector two ints matrix to store all of that// the small red square is the top left corner of the marker
        detectMarkers(image, dictionary, corners, ids); //can add the camera matrix and distortion coeffs here too...
    
        // if at least one marker detected
        if (ids.size() > 0){ // this means the image will only be refresshed if at least one marker is detected
           
           double line_length = norm(corners[0][0]-corners[0][2]);
           double distance ;
           Point origin (50,50);
           double a(0.002929),b(-2.239),c(527.2);// a,b and c are the coeffecients of the second order polynomial.// move these up
           distance = a*line_length*line_length +b*line_length + c;
           putText(imageCopy,to_string(distance),origin, FONT_HERSHEY_SCRIPT_COMPLEX, 2.1,
                   Scalar(0, 0, 255), 2, LINE_AA);    
           line (imageCopy,corners[0][0],corners[0][2],Scalar(255,0,0),2);
           drawDetectedMarkers(imageCopy, corners, ids);
           imshow("detected markers", imageCopy);  // placing this in the for means that the outout video won't get updated if there are no ar tags in the input video 
        }
        char c=(char)waitKey(25);  //int to char i guess but why ?
        if(c==27)
          break;
    }
    input_vid.release();
    destroyAllWindows();
    return 0;
}

/// still needs to be optimised for tilted view, do we rectify the image first ??...