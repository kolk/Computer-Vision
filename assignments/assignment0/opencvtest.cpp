#include <opencv2/highgui/highgui.hpp>
#include<opencv/cvaux.h>
#include<opencv/cxcore.h>
#include <opencv2/imgproc.hpp>
#include <iostream>


using namespace cv;
using namespace std;

int main()
{
   Mat img = imread("/home/vaishali/Pictures/Wallpapers/werewolfboy.jpg");
   imshow("opencvtest", img);
   waitKey(0);
   return 0;
}
