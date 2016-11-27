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

		//foreground video object
		VideoCapture foregrndCap(foregrndPath);
		if(!foregrndCap.isOpened()) {
				cerr << "Cannot open 1st video!" << endl;
				return -1;
		}

		//FPS of foreground video
		double foregrndFps = foregrndCap.get(CV_CAP_PROP_FPS);

		//background video object
		VideoCapture backgrndCap(backgrndPath);
		if(!backgrndCap.isOpened()) {
				cerr << "Cannot open 2nd video!" << endl;
				return -1;
		}

		//FPS of background video
		double backgrndFps = backgrndCap.get(CV_CAP_PROP_FPS);

		Mat frame1, frame2;

		//encoding of the output video
		int fourcc = CV_FOURCC('F', 'M', 'P', '4');
		if(!fourcc) {
				cerr << "codec not found" << endl;
				return -1;
		}

		//FPS of output video chosen to be the smaller FPS of input videos
		double fps;
		if(foregrndFps < backgrndFps) 
				fps = foregrndFps;   
		else
				fps = backgrndFps;

		// FPS provided by user 
		if (argc > 2) {
				fps = stoi(argv[2]);
		}

		Mat foregrnd, backgrnd;
		foregrndCap >> foregrnd;
		backgrndCap >> backgrnd;

		//output frame size chosen to be the smaller of the input videos
		Size foreSz = foregrnd.size();
		Size backSz = backgrnd.size();
		int mergedHt = foreSz.height, mergedWdth = foreSz.width;
		if(foreSz.height > backSz.height) 
				mergedHt = backSz.height;
		if(foreSz.width > backSz.width)
				mergedWdth = backSz.width;

		CvSize framesize = cvSize(mergedWdth, mergedHt);

		// output video object creation
		VideoWriter wtr("mergedVideo.avi", fourcc, fps, framesize, true);

		// read frames from input videos until 
		// either of the 2 videos are done
		while(true) { 
				foregrndCap >> frame1;
				backgrndCap >> frame2;

				// if no more frames to read, then done
				if(frame1.empty() || frame2.empty()) {
						break;
				}

				//resize image frames to be the smallest frame size
				resize(frame1, frame1, framesize);
				resize(frame2, frame2, framesize);

				Mat foregrnd, backgrnd = frame2;
				Mat output(frame1.rows, frame1.cols, frame1.type());
				vector<Mat> channels;

				// convert foreground frame from RGB to YUV colorspace
				cvtColor(frame1, foregrnd, CV_BGR2YUV);

				// split the foreground frame into Y, U, V channels      
				split(foregrnd, channels);

				for(int y = 0; y < frame1.rows; y++) {
						for(int x = 0; x < frame1.cols; x++) {

								//if color blue-diff channel has value less than 120, 
								//then replace pixel val with background value
								Vec3b color = foregrnd.at<Vec3b>(Point(x,y));
								if(color[1] > 120) {
										output.at<Vec3b>(Point(x,y)) 
												= frame1.at<Vec3b>(Point(x,y));
								}
								else {
										output.at<Vec3b>(Point(x,y)) 
												= frame2.at<Vec3b>(Point(x,y));
								}

						}
				}
				//stream output frame to video object
				wtr << output;
		}
		return 0;
}
