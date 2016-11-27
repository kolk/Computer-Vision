
% close all;
% I1 = imread('check1.jpg');
% I2 = imread('check2.jpg');
% m = size(img1Pts,1);
% n = randperm(m);
% im1 = img1Pts(n,:);
% im2 = img2Pts(n,:);
% 
% indices = randperm(m, 4);
% imP1 = im1(indices,:);
% imP2 = im2(indices, :);

function p = dlt(imP2,imP1)
    %close all;
    %I1 = imresize(imread('pt1.jpg'), 0.5);
    %I2 = imresize(imread('pt2.jpg'),0.5);
    %{
    figure;
    imshow(Ia);
    figure;
    imshow(Ib);
    imP2 = [658, 120, 1;
        784, 624, 1;
        402, 116, 1;
        1592, 164, 1;
        ];
    imP1 = [670, 120, 1;
        794, 622, 1;
        420, 118, 1;
        1592, 180, 1];
%}     

A = zeros(9,9);
    k = 1;
    for i = 1:4
        imPt = imP2(i, 1);
        A(k, 1:3) = -imP1(i,:);
        A(k,4:6) = zeros(1,3);
        A(k,7:9) = [imPt*imP1(i,1), imPt*imP1(i,2), imPt*imP1(i,3)];
        k = k + 1;

        imPt = imP2(i, 2);
        A(k,1:3) = zeros(1,3);
        A(k, 4:6) = -imP1(i,:);
        A(k,7:9) = [imPt*imP1(i,1), imPt*imP1(i,2), imPt*imP1(i,3)];
        k = k + 1;
    end

    [U, S, V] = svd(A);
    singV = diag(S);
    [~, indx] = sort(singV);
    condNum = singV(indx(end))/singV(indx(1))
    p = V(:, indx(1));
    p = reshape(p, [3,3])';
    p = p/p(3,3);
    estimatedImg = p*imP1';
    imgEst = (estimatedImg ./ repmat(estimatedImg(3,:),3,1))';
    H = p(:,1:3);
    invH = inv(H);
    [invR, invK] = qr(invH);
    R = invR'
    K = inv(invK)
    C = invH*p(:,3)
    
%     estI2 = p*img1Pts';
%     estI2 = (estI2 ./ repmat(estI2(3,:),3,1))';
%  
%     figure;
%     imshow(I2);
%     hold on;
%     plot(im2(:,1), im2(:,2), 'r*', 'LineWidth', 3);
%     plot(estI2(:,1), estI2(:,2), 'bo', 'LineWidth',2);  
% 
% figure;
% imshow(I2);
% hold on;
% plot(imP2(:,1), imP2(:,2),  'r*', 'LineWidth',7);
% plot(imgEst(:,1), imgEst(:,2), 'yo', 'LineWidth',2);  
% end