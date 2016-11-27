#include<opencv2/core/core.hpp>
#include<opencv2/highgui/highgui.hpp>
#include<opencv2/imgproc/imgproc.hpp>
#include<iostream>
#include<string>

using namespace cv;
using namespace std;

int main(int argc, char** argv) {
   string foregrndPath("me6.webm"); 
   string backgrndPath("Fly To Space Earth.mp4");
   if(argc == 3) {
    foregrndPath = argv[1];
    backgrndPath = argv[2]; 
   }

   VideoCapture foregrndCap(foregrndPath);
   if(!foregrndCap.isOpened()) {
      cerr << "Cannot open 1st video!" << endl;
      return -1;
   }
   double foregrndFps = foregrndCap.get(CV_CAP_PROP_FPS);

   VideoCapture backgrndCap(backgrndPath);
   if(!backgrndCap.isOpened()) {
      cerr << "Cannot open 2nd video!" << endl;
      return -1;
   }

   double backgrndFps = backgrndCap.get(CV_CAP_PROP_FPS);
   Mat frame1, frame2, foregrndGray, backgrndGray, merged;
   int fourcc = CV_FOURCC('F', 'M', 'P', '4');
   double fps;
   if(foregrndFps < backgrndFps) 
      fps = foregrndFps;   
   else
      fps = backgrndFps;

   if (argc > 2) {
      fps = stoi(argv[2]);
   }

   Mat foregrnd, backgrnd;
   foregrndCap >> foregrnd;
   backgrndCap >> backgrnd;
   Size foreSz = foregrnd.size();
   Size backSz = backgrnd.size();
   int mergedHt = foreSz.height, mergedWdth = foreSz.width;
   if(foreSz.height > backSz.height) 
   mergedHt = backSz.height;
   if(foreSz.width > backSz.width)
    mergedWdth = backSz.width;

   CvSize framesize = cvSize(1280, 720);
   if(!fourcc) {
      cerr << "codec not found" << endl;
      return -1;
   }

   VideoWriter wtr("mergedVideo.avi", fourcc, fps, framesize, true);

   while(true) { 
      foregrndCap >> frame1;
      backgrndCap >> frame2;

      if(frame1.empty() || frame2.empty()) {
         break;
      }

      resize(frame1, frame1, framesize);
      resize(frame2, frame2, framesize);
    //merged = mergeFrames(frame1, frame2);
    /* Mat foregrnd = frame1, backgrnd = frame2;
    Mat output(frame1.rows, frame1.cols, foregrnd.type());
    vector<Mat> channels;
    split(foregrnd, channels);
    for(int y = 0; y < foregrnd.rows; y++) {
        for(int x = 0; x < foregrnd.cols; x++) {
            Vec3b color = foregrnd.at<Vec3b>(Point(x,y));
            //Vec3b green = channels[1].at<Vec3b>(Point(x,y))[1];
            //Vec3b red = channels[2].at<Vec3b>(Point(x,y))[2];
            if(color[0] > 100 && color[1] > 100 && color[2] < 90) {
                output.at<Vec3b>(Point(x,y)) = backgrnd.at<Vec3b>(Point(x,y));
            }
            else {
                output.at<Vec3b>(Point(x,y)) = foregrnd.at<Vec3b>(Point(x,y));
            }
        }
     }
    imshow("merge", output);
    waitKey(30);
    */
    Mat foregrnd, backgrnd = frame2;
    Mat output(frame1.rows, frame1.cols, frame1.type());
    vector<Mat> channels;
    cvtColor(frame1, foregrnd, CV_BGR2YUV);
    split(foregrnd, channels);
    double min, max;
    for(int y = 0; y < frame1.rows; y++) {
        for(int x = 0; x < frame1.cols; x++) {
            Vec3b color = foregrnd.at<Vec3b>(Point(x,y));
                if(color[1] > 120) {
                    output.at<Vec3b>(Point(x,y)) = frame1.at<Vec3b>(Point(x,y));
                }
                else {
                    output.at<Vec3b>(Point(x,y)) = frame2.at<Vec3b>(Point(x,y));
                }
 
        }
    }
//	imshow("merge", output);
//	waitKey(30);
    wtr << output;
    }
    return 0;
}
