#include<opencv2/highgui/highgui.hpp>
#include<opencv2/core/core.hpp>
#include<iostream>
#include<string>
#include<dirent.h>
#include<vector>
#include<algorithm>

using namespace std;
using namespace cv;

//comapre function for sort function
bool comp(const string& a, const  string& b) {
		string str_a,str_b;
		str_a=a.substr(5,a.length()-9);
		str_b=b.substr(5,b.length()-9);
		int int_a,int_b;
		int_a=stoi(str_a);
		int_b=stoi(str_b);
		return (int_a<=int_b)?true:false ;
}



int main(int argc, char** argv) {
		//images path
		string filepath("videoFrames");
		if(argc > 2) {
				filepath = argv[2];
				cout << "filepath " << filepath << endl;
		}

		//access image files in the directory
		DIR *dir = opendir(filepath.c_str());
		if( dir == NULL) {
				cerr << "Directory not found " << endl;
				return -1;
		}


		string imagePath;
		struct dirent *ent;
		Mat img;
		
		//parameters for the video
		int fourcc = CV_FOURCC('F', 'M', 'P', '4');
		double fps = 30;
		if (argc > 1) {
				fps = stoi(argv[1]);
		}

    	 string filename("myVideo_fps" + to_string((int)fps)+ ".avi");

		CvSize framesize = cvSize(1280, 720);
		if(!fourcc) {
				cerr << "codec not found" << endl;
				return -1;
		}

		//create VideoWriter object to write images to the video file
		VideoWriter wtr(filename, fourcc, fps, framesize, true);
		
		//store all image names in a vector
		vector <string> dirContent;
		while ((ent = readdir(dir)) != NULL) {

				string imgName = ent->d_name;
				if(imgName == "." || imgName == "..")
						continue;  
				dirContent.push_back(string(ent->d_name));
		}
		closedir(dir);

		//sort the images names
		sort(dirContent.begin(), dirContent.end(), comp);

		//write the images to the video 
		for(int i = 0; i < dirContent.size(); i++) {
				string imgPath =  filepath + "/" + dirContent[i];
				img = imread(imgPath);
				wtr << img;
		} 
		return 0;
}
