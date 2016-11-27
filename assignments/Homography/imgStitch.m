close all;
clear all;

Ia = imread('test5.jpg');
Ib = imread('test6.jpg');
[im1Pts, im2Pts, Ia, Ib] = sift(Ia, Ib);

im1Pts = [im1Pts; ones(1, size(im1Pts,2))];
im1Pts = im1Pts';
im2Pts = [im2Pts; ones(1, size(im2Pts,2))];
im2Pts = im2Pts';

[p, K, R, C, imgEstimated] = ransac(im2Pts, im1Pts, Ib, Ia);

im1 = Ia;
im2 = Ib;
p = p/p(3,3);
T=maketform('projective',p');

[im2t,xdataim2t,ydataim2t]=imtransform(im1,T);
%now xdataim2t and ydataim2t store the bounds of the transformed im2
xdataout=[min(1,xdataim2t(1)) max(size(im2,2),xdataim2t(2))];
ydataout=[min(1,ydataim2t(1)) max(size(im2,1),ydataim2t(2))];
% let's transform both images with the computed xdata and ydata
im2t=imtransform(im1,T,'XData',xdataout,'YData',ydataout);
im1t=imtransform(im2,maketform('affine',eye(3)),'XData',xdataout,'YData',ydataout);

figure;
imshow(im2t);
figure;
imshow(im1t);
ims=max(im1t,im2t);
figure;
imshow(ims);



Ic = imread('test7.jpg');
[im1Pts, im2Pts, Ib, Ic] = sift(Ib, Ic);

im1Pts = [im1Pts; ones(1, size(im1Pts,2))];
im1Pts = im1Pts';
im2Pts = [im2Pts; ones(1, size(im2Pts,2))];
im2Pts = im2Pts';
size(im1Pts)
size(im2Pts)
[p, K, R, C, imgEstimated] = ransac(im2Pts, im1Pts, Ic, Ib);

im1 = Ib;
im2 = Ic;
p = p/p(3,3);
T=maketform('projective',p');

[im2t,xdataim2t,ydataim2t]=imtransform(im1,T);
%now xdataim2t and ydataim2t store the bounds of the transformed im2
xdataout=[min(1,xdataim2t(1)) max(size(im2,2),xdataim2t(2))];
ydataout=[min(1,ydataim2t(1)) max(size(im2,1),ydataim2t(2))];
% let's transform both images with the computed xdata and ydata
im2t=imtransform(im1,T,'XData',xdataout,'YData',ydataout);
im1t=imtransform(im2,maketform('affine',eye(3)),'XData',xdataout,'YData',ydataout);
 
figure;
imshow(im2t);
figure;
imshow(im1t);

im2t = imresize(im2t, [size(im1t,1), size(im1t,2)]);

ims3=max(im1t,im2t);
figure;
imshow(ims);

figure;
imshow(ims3);


[im1Pts, im2Pts, ims, ims3] = sift(ims, ims3);

im1Pts = [im1Pts; ones(1, size(im1Pts,2))];
im1Pts = im1Pts';
im2Pts = [im2Pts; ones(1, size(im2Pts,2))];
im2Pts = im2Pts';
size(im1Pts)
size(im2Pts)
[p, K, R, C, imgEstimated] = ransac(im2Pts, im1Pts, ims3, ims);

im1 = ims;
im2 = ims3;
p = p/p(3,3);
T=maketform('projective',p');

[im2t,xdataim2t,ydataim2t]=imtransform(im1,T);
%now xdataim2t and ydataim2t store the bounds of the transformed im2
xdataout=[min(1,xdataim2t(1)) max(size(im2,2),xdataim2t(2))];
ydataout=[min(1,ydataim2t(1)) max(size(im2,1),ydataim2t(2))];
% let's transform both images with the computed xdata and ydata
im2t=imtransform(im1,T,'XData',xdataout,'YData',ydataout);
im1t=imtransform(im2,maketform('affine',eye(3)),'XData',xdataout,'YData',ydataout);

ims4=max(im1t,im2t);
figure;
imshow(ims4);