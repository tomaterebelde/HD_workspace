////////// Polyfit generator /////////
// use matlab to find a polynomial fit that estimates the ditance between the AR tag and the camera
// to run this code you need to have a list of images taken before of the AR tag at known distances from the camera
// set lower limit and step distance values and modify the fiel paths
// copy the results into the matlab poly fit tool

#include <opencv2/aruco.hpp>
#include <opencv2/opencv.hpp>
#include <opencv2/calib3d/calib3d.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <stdio.h>
#include <iostream>
#include <string>
#include <vector>
#include <fstream>

int main () {
    
    // Extracting path of individual image stored in a directory
    std::vector<cv::String> images;
    // Path of the folder containing images
    std::string path = "/home/aloksha/projects/one_cam_dep/test_images/*.jpg";   // ithink *.jpg means all the files in .jpg

    cv::glob(path, images);
    cv::Mat frame;
    cv::Ptr<cv::aruco::DetectorParameters> parameters = cv::aruco::DetectorParameters::create();        //defines the detection params can be tuned...    
    cv::Ptr<cv::aruco::Dictionary> dictionary = cv::aruco::getPredefinedDictionary(cv::aruco::DICT_7X7_250);
    // read input test images and opeen file for writing //
    
    std::ofstream fw("/home/aloksha/projects/one_cam_dep/results.txt", std::ofstream::out);
    
    for(int i{0}; i<images.size(); i++){
        frame = cv::imread(images[i]);
        
        //AR tag detection//
        std::vector<int> markerIds;
        std::vector<std::vector<cv::Point2f>> markerCorners, rejectedCandidates;
        cv::aruco::detectMarkers(frame, dictionary, markerCorners, markerIds, parameters, rejectedCandidates);
        
        //create output image with detected objects find line distance and show it//
        cv::Mat outputImage = frame.clone();
        cv::line (outputImage,markerCorners[0][0],markerCorners[0][2],cv::Scalar(255,0,0),2);
        double dist = cv::norm(markerCorners[0][0]-markerCorners[0][2]); //get distance in pixles between the 2 corers of the AR atg
        //std::cout<< dist<< std::endl; 
        cv::aruco::drawDetectedMarkers(outputImage, markerCorners, markerIds);
        cv::imshow("result", outputImage);  //display result
        cv::waitKey(0); //keep displaying it forever
        
        //write to file//
        if (fw.is_open()){
            fw << dist <<"\n"; 
        }
        else std::cout << "Problem with opening file"<<std::endl;
    }
    int limit_low (50);    // closest the camera could get to the AR while having all of its corners visible
    int limit_high(300);  // farthest the camera can get from the AR tag
    int step (50);     // minimise step for a better polyfit
    if (fw.is_open()){
        for(int i(limit_high);i>=limit_low;i=i-step){ 
            fw << i <<"\n"; 
        }
        fw.close();
    }
    return 0;
}   
