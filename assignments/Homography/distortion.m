close all;
clear all;

Ia = imread('P_20160606_125308.jpg');
%Ib = imread('cal2.jpg');
Ib = imread('P_20160606_125308.jpg');

imshow(Ia);
figure;
imshow(Ib);

p1 = [ 198, 407, 1;
    230, 1699, 1;
    2935, 1627,1;
    2915, 323, 1];
%{
p2 = [270, 494, 1;
    502, 1279, 1;
    2355, 1315, 1;
    2607, 582, 1];
  %}  
    
p1 = [ 859, 1687, 1;
    3051, 1683, 1;
    855, 715,1;
    3035, 739, 1];


p2 = [767, 1771, 1;
    3063, 1863, 1;
    3027, 671, 1;
    947, 699, 1];
 p = dlt(p1, p2);
 p = p/p(3,3);
 T=maketform('projective',p');

[im2t,xdataim2t,ydataim2t]=imtransform(Ib,T);
%now xdataim2t and ydataim2t store the bounds of the transformed im2
%xdataout=[min(1,xdataim2t(1)) max(size(Ia,2),xdataim2t(2))];
ydataout=[min(1,ydataim2t(1)) max(size(Ia,1),ydataim2t(2))];
% let's transform both images with the computed xdata and ydata
%im2t=imtransform(Ib,T,'XData',xdataout,'YData',ydataout);
%im1t=imtransform(Ia,maketform('affine',eye(3)),'XData',xdataout,'YData',ydataout);

figure;
imshow(im2t);
