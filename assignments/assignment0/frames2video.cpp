#include<opencv2/highgui/highgui.hpp>
#include<opencv2/core/core.hpp>
#include<iostream>
#include<string>
#include<dirent.h>
#include<vector>
#include<algorithm>

using namespace std;
using namespace cv;

bool comp(const string& a, const  string& b) {
    if (a.empty())
        return true;
    if (b.empty())
        return false;
    if (isdigit(a[0]) && !isdigit(b[0]))
        return true;
    if (!isdigit(a[0]) && isdigit(b[0]))
        return false;
    if (!isdigit(a[0]) && !isdigit(b[0]))
    {
        if (toupper(a[0]) == toupper(b[0]))
            return comp(a.substr(1), b.substr(1));
        return (toupper(a[0]) < toupper(b[0]));
    }

    // Both strings begin with digit --> parse both numbers
    std::istringstream issa(a);
    std::istringstream issb(b);
    int ia, ib;
    issa >> ia;
    issb >> ib;
    if (ia != ib)
        return ia < ib;

    // Numbers are the same --> remove numbers and recurse
    std::string anew, bnew;
    std::getline(issa, anew);
    std::getline(issb, bnew);
    return (comp(anew, bnew));
   
}



int main(int argc, char** argv) {
   string filepath("videoFrames");
   if(argc > 1) {
      filepath = argv[1];
   }
   DIR *dir = opendir(filepath.c_str());
   if( dir == NULL) {
      cerr << "Directory not found " << endl;
      return -1;
   }
   string imagePath;
   struct dirent *ent;
   Mat img;
   string filename("myVideo.avi");
   int fourcc = CV_FOURCC('F', 'M', 'P', '4');
   double fps = 30;
   if (argc > 2) {
      fps = stoi(argv[2]);
   }
   CvSize framesize = cvSize(1280, 720);
   if(!fourcc) {
      cerr << "codec not found" << endl;
      return -1;
   }
   VideoWriter wtr(filename, fourcc, fps, framesize, true);
   vector <string> dirContent;
   while ((ent = readdir(dir)) != NULL) {

      string imgName = ent->d_name;
      if(imgName == "." || imgName == "..")
         continue;  
      dirContent.push_back(string(ent->d_name));
      /*string imgPath =  filepath + "/" + imgName;
      img = imread(imgPath);
      cout << "Reading "<< imgPath<< endl;
     // imshow(imgPath,img);
     // waitKey(30);
      wtr << img;
     */
   }
   closedir(dir);
   sort(dirContent.begin(), dirContent.end(), comp);
   //cout << dirContent << endl;
   for(int i = 0; i < dirContent.size(); i++) {
      string imgPath =  filepath + "/" + dirContent[i];
      img = imread(imgPath);
      //cout << "Reading "<< imgPath<< endl;
     // imshow(imgPath,img);
     // waitKey(30);
     wtr << img;

   } 
   return 0;
}
