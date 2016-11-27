


%function harris()

   %clc;
   %close all;

%    I = imread('IMG_5455.jpg');
%    I = rgb2gray(I);
%    G = fspecial('gaussian',[3 3],2);
%    Ig = imfilter(I,G, 'same');
%    figure;
%    imshow(Ig);
%    
%    [Ix, Iy] = imgradientxy(Ig);
%    R = zeros(size(Ix));
%    k = 0.05;
%    thresh = 0;
%    for i= 1:size(Ix, 1)
%        for j = 1:size(Ix,2)
%            H = [ Ix(i,j).^2, Ix(i,j); Iy(i,j).^2, Iy(i,j)];
%            %[V, D] = eig(H);
%            %disp('*********');
%            %if((k*(D(1,1) + D(2,2))^2) == 0)
%                %disp('div by 0');
%                
%            %else
%                R(i,j) = det(H)-k*(trace(H))^2;
%            %end
%        end
%    end
   
 thresh = max(R(:));
    corners = zeros(size(Ix,1)*size(Ix,2),2);
    k = 1;
    for i = 1:size(Ix, 1)
        for j = 1:size(Ix, 2)
            window = (Ix(max(i-1, 1):min(i+1,size(Ix,1)),max(j-1, 1):min(j+1, size(Ix,2))));
            [m, ind] = max(window(:));
            if (ind == 5)
               corners(k,1) = i;
               corners(k,2) = j;
               k = k + 1;
           end
       end
    end
   
   [r, indx] = sort(R(:), 'descend');
   [p, q] = ind2sub(size(Ix), indx(1:6));
   figure;
   imshow(I);
   hold on;
   plot(corners(p,1), corners(q,2), 'r*');
   %[Ix, Iy] = imgradient(Ig);
   %figure;
   %imshow(Ix);
   %figure;
   %imshow(Iy);

%end