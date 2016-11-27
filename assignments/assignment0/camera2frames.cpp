#include<iostream>
#include<string>
#include<opencv2/core/core.hpp>
#include<opencv2/highgui/highgui.hpp>

using namespace std;
using namespace cv;

int main(int argc, char** argv) {
		//create video object from default camera
		VideoCapture cap(0);
		if(!cap.isOpened()) {
				cerr << "Camera cannot be opened" << endl;
				return -1;
		}

		//copy frames into filepath
		Mat frame;
		string filepath = "cameraFrames/";
		int num = 1;
		char c;

		//keep on recording and diplaying video until user presses 'q'
		while(c != 'q') {
				cap >> frame;
				if(!frame.data) 
						continue;
				string path = filepath + to_string(num++) + ".jpg";
				imwrite(path, frame);
				imshow("video", frame);
				c = waitKey(30);
		}
		return 0;
}
