#include <opencv2/highgui/highgui.hpp>
#include<opencv/cvaux.h>
#include<opencv/cxcore.h>
#include <opencv2/imgproc.hpp>
#include <iostream>


using namespace cv;
using namespace std;

int main()
{
   Mat image;
   
   VideoCapture cap;
   int camOpen = cap.open(CV_CAP_ANY);
   namedWindow("video", CV_WINDOW_AUTOSIZE);
   char k = 'y';
   while(k != 'q') {
      cap >> image;
      imshow("video", image);
      k = waitKey(20);
   }
   return 0;

}

