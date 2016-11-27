function overlay()
    close all;
    clear all;
    Iaf = imread('field.jpg');
    Ias = imread('swimming.jpg');
    Iat = imread('tabletennis.jpg');
    Ib = imread('cocacola.jpg');

    p1Field = [530, 612, 1;
        658, 621, 1;
        720, 430, 1;
        657, 426, 1];

    p1Pool = [205, 320,1;
        254, 307, 1;
        169, 268,1;
        130, 276, 1];

    p1Table = [302, 118, 1;
        370, 120, 1;
        330, 206, 1;
        254, 200, 1];


    p2 = [1,1, 1;
        1, 117, 1;
        423, 117, 1;
        423, 1, 1];

    
    
    
     %% table

    p = dlt(p1Table, p2);
    
    p = p/p(3,3);

    [im1t, im2t]=transform(p, Iat, Ib);
    imsField = max(im1t,im2t);
    figure;
    imshow(imsField);


    %% pool
    
    p = dlt(p1Pool, p2);
    p = p/p(3,3);

    [im1t, im2t]=transform(p, Ias, Ib);
    %pool
    out = zeros(size(im1t));
    out = im1t/2 +im2t/2;
    alphaR = 0.5;
    out(:,:,1) = alphaR * im1t(:,:,1) + (1 - alphaR) * im2t(:,:,1);
    alphaG = 0.5;
    out(:,:,2) = alphaG * im1t(:,:,2) + (1 - alphaG) * im2t(:,:,2);
    alphaB = 0.5;
    out(:,:,3) = alphaB * im1t(:,:,3) + (1 - alphaB) * im2t(:,:,3);

    imshow(mat2gray(out));


    %% field
    
    p = dlt(p1Field, p2);
    p = p/p(3,3);

    [im1t, im2t]=transform(p, Iaf, Ib);
    imsSwim=max(im1t,im2t);
    figure;
    imshow(imsSwim);


end

function [im1t, im2t] =  transform(p, Ia, Ib)
    T=maketform('projective',p');

    [im2t,xdataim2t,ydataim2t]=imtransform(Ib,T);
    %now xdataim2t and ydataim2t store the bounds of the transformed im2
    xdataout=[min(1,xdataim2t(1)) max(size(Ia,2),xdataim2t(2))];
    ydataout=[min(1,ydataim2t(1)) max(size(Ia,1),ydataim2t(2))];
    % let's transform both images with the computed xdata and ydata
    im2t=imtransform(Ib,T,'XData',xdataout,'YData',ydataout);
    im1t=imtransform(Ia,maketform('affine',eye(3)),'XData',xdataout,'YData',ydataout);
    %im1t = im1;
    figure;
    imshow(im2t);
    figure;
    imshow(im1t);
    im2t = imresize(im2t, [size(im1t,1), size(im1t,2)]);

end
% 
