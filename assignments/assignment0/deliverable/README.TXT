There are 3 source files:
video2images.cpp - opens video and segments it into images
camera2frames.cpp - opens webcam and reads video frames
frames2video2.cpp - reads images and creates a video from them
2 Steps are required for compiling and running the code

1)To compile the code, run the following command in the command line:
g++ -ggdb `pkg-config --cflags opencv` -o `basename <fileName>.cpp .cpp` <fileName>.cpp `pkg-config --libs opencv` -std=c++11

or make <fileName>

2) To run the code, copy the videos in the cuurent directory
./<fileName>
