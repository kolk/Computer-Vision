function [im1Pts, im2Pts, Ia, Ib] = sift(Ia, Ib)
    
%     Ia = imresize(imread('lap1.jpg'), 0.5);
%     Ib = imresize(imread('lap2.jpg'),0.5);

      if(size(Ia, 1) > 1000 || size(Ia, 2) > 1000)
          Ia = imresize(Ia, 0.5);
      end
     
      if(size(Ib, 1) > 1000 || size(Ib, 2) > 1000)
          Ib = imresize(Ib, 0.5);
      end
      
      im1Pts = zeros(0, 3);
      img2Pts = zeros(0,3);
       peak_thresh = 0.05;
      edge_thresh = 6.5;
      %while(size(im1Pts,1) < 4 && size(img2Pts,1) < 4)
%             peak_thresh = max(0, peak_thresh - 1);
%             edge_thresh = max(10, edge_thresh - 1);
           [fa,da] = vl_sift(im2single(rgb2gray(Ia)));%, 'PeakThresh', peak_thresh, 'edgethresh', edge_thresh) ;
           [fb,db] = vl_sift(im2single(rgb2gray(Ib)));%, 'PeakThresh', peak_thresh, 'edgethresh', edge_thresh) ;
      %end
       
size(fa)
size(fb)
      [matches, scores] = vl_ubcmatch(da,db) ;

    [drop, perm] = sort(scores, 'ascend') ;
    matches = matches(:, perm) ;
    scores  = scores(perm) ;

    sz = min(100, length(scores));
    matches = matches(:,1:sz);
    scores = scores(1:sz);


%     figure ; 
%     clf ;
%     imagesc(cat(2, Ia, Ib)) ;
%     axis image off ;
%     vl_demo_print('sift_match_1', 1) ;
% 
%     figure(2) ; clf ;
%     imagesc(cat(2, Ia, Ib)) ;
% 
    im1Pts = fa(1:2,matches(1,:));
    im2Pts = fb(1:2,matches(2,:));
    
%     im1Pts = [im1Pts; ones(1, size(im1Pts,2))];
%     im1Pts = im1Pts';
%     im2Pts = [im2Pts; ones(1, size(im2Pts,2))];
%     im2Pts = im2Pts';
%      size(im1Pts)
%      size(im2Pts)
    %[p, K, R, C, imgEstimated] = ransac(im1Pts, im2Pts, Ia, Ib);
%     m = size(im1Pts,1);
%     indices = randperm(m, 4);
%    imP1 = im1Pts(indices,:);
%    imP2 = im2Pts(indices, :);
% 
%     p = dlt(imP2,imP1);
% 
%     
%    estI2 = p*im1Pts';
%    estI2 = (estI2 ./ repmat(estI2(3,:),3,1))';
%    figure;
% imshow(Ib);
% 
% hold on;
% plot(im2Pts(:,1), im2Pts(:,2), 'r*', 'LineWidth',3);
% plot(estI2(:,1), estI2(:,2), 'bo', 'LineWidth',2); 
% legend('actual Points','estimated points') 


%     xa = fa(1,matches(1,:)) ;
%     xb = fb(1,matches(2,:)) + size(Ia,2) ;
%     ya = fa(2,matches(1,:)) ;
%     yb = fb(2,matches(2,:)) ;
% 
%     hold on ;
%     h = line([xa ; xb], [ya ; yb]) ;
%     set(h,'linewidth', 1, 'color', 'b') ;
% 
%     vl_plotframe(fa(:,matches(1,:))) ;
%     fb(1,:) = fb(1,:) + size(Ia,2) ;
%     vl_plotframe(fb(:,matches(2,:))) ;
%     axis image off ;
% 
%     vl_demo_print('sift_match_2', 1) ;
end
