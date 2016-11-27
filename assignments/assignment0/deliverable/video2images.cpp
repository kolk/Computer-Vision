#include<opencv2/core/core.hpp>
#include<opencv2/highgui/highgui.hpp>
#include<iostream>
#include<string>

using namespace cv;
using namespace std;

int main(int argc, char** argv)
{
		 //name of video file
		 String videoPath("Spirit_ Stallion of the Cimarron.mp4");
		 if (argc == 2)
				 videoPath = argv[1];

		 //object to capture video 
		 VideoCapture cap(videoPath);
		 if (!cap.isOpened()) {
				 cerr << "Error: could not load video\n";
				 return -1;
	     }

		 //Capture successive frames from video object
		 Mat frame;
		 int num = 1;
		 while(true) {   
				 cap >> frame;
				 if(!frame.data)
						 break;

				 //write frame to file
				 
				 string filename = "space/frame" +  to_string(num++) + ".jpg";
				 imwrite(filename, frame);
	     }
   return 0;
}
