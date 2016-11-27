function planarStitch()
    close all;
    clear all;
    I1 = imread('planar1.jpg');
    I2 = imread('planar2.jpg');
    I3 = imread('planar3.jpg');
    
    %% stitch image 1 and 2
    [im1Pts, im2Pts, I1, I2] = sift(I1, I2);

    im1Pts = [im1Pts; ones(1, size(im1Pts,2))]';
    im2Pts = [im2Pts; ones(1, size(im2Pts,2))]';
    [p, K, R, C, imgEstimated] = ransac(im2Pts, im1Pts, I2, I1);

    p = p/p(3,3);
    p = p';
    [im1t1, im2t1] = transform(p, I1, I2);
    ims=max(im1t1,im2t1);
    figure;
    imshow(ims);

%% stitch image 2 and 3

    [im1Pts, im2Pts, I2, I3] = sift(I2, I3);

    im1Pts = [im1Pts; ones(1, size(im1Pts,2))]';
    im2Pts = [im2Pts; ones(1, size(im2Pts,2))]';
    [p, K, R, C, imgEstimated] = ransac(im2Pts, im1Pts, I3, I2);
    p = p/p(3,3);
    p = p';
    [im1t1, im2t1] = transform(p, I2, I3);

    im2t2 = imresize(im2t2, [size(im1t2,1), size(im1t2,2)]);
    ims3=max(im1t1,im2t1);
    figure;
    imshow(ims3);

%% stitch the stitched images
    [im1Pts, im2Pts, ims, ims3] = sift(ims, ims3);
   
    im1Pts = [im1Pts; ones(1, size(im1Pts,2))]';
    im2Pts = [im2Pts; ones(1, size(im2Pts,2))]';
    [p, K, R, C, imgEstimated] = ransac(im2Pts, im1Pts, ims3, ims);
    p = p/p(3,3);
      p = p';
    [im1t, im2t] = transform(p, ims, ims3); 
    figure;
    imshow(im1t);
    figure;
    imshow(im2t);
    ims4=max(im1t,im2t);
    figure;
    imshow(ims4);
end

function [im1t, im2t] = transform(p, im1, im2)
     H=maketform('projective',p);

    [im2t,xRangeim2,yRangeim2]=imtransform(im1,H);

    xRangeF = [min(1,xRangeim2(1)) max(size(im2,2),xRangeim2(2))];
    yRangeF = [min(1,yRangeim2(1)) max(size(im2,1),yRangeim2(2))];
    im2t=imtransform(im1,H,'XData',xRangeF,'YData',yRangeF);
    im2T = maketform('affine',eye(3));
    im1t=imtransform(im2,im2T,'XData',xRangeF,'YData',yRangeF);
end