 close all;
 I = imread('Checkerboard4.jpg');
 figure;
 imshow(I);
 I = rgb2gray(I);
 C = corner(I, 'harris');
figure;
imshow(I);
hold on;
 plot(C(100:104,1),C(100:104,2),'r*');
 plot(C(106:114,1), C(106:114,2),'r*');
% plot(C(114,1),C(114,2),'r*');
% plot(C(113,1), C(113,2), 'g*');
% plot(C(112,1), C(112,2), 'b*');
% plot(C(111,1), C(111,2), 'y*');
% plot(C(110,1), C(110,2), 'b*');
% plot(C(109,1), C(109,2), 'k*');
% plot(C(108,1), C(108,2), 'c*');
% plot(C(107,1), C(107,2), 'w*');
% 
 imgCoord = [C(100:104,:), ; C(106:114,:)];
 imgCoord = [imgCoord, repmat(1,size(imgCoord,1),1)]
 worldCoord = [15.7, 0.7,0,1;
              11.2, 6.3, 0,1;
              1.0, 6.3, 3.4, 1;
              2.1, 6.3, 5.6, 1;
              18, 0.7, 0, 1;
              5.7, 6.3, 4.6,1;
              13.6, 4.1, 1,1;
              3.4,5.2,0,1;
              7.8, 6.3, 1,1;
              12.4,1.7,0,1;
              3.4, 2.9,0,1;
              5.7, 6.3, 6.4,1;
              0,6.3,1.1,1;
              4.5, 6.3,3.4,1];
          [p, K, R, c, imgEstimated] = RANSAC(imgCoord, worldCoord);
%           DLT(imgCoord, worldCoord);
%               
              
              

