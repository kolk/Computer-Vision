Ia = imread('pt1.jpg');
Ib = imread('pt2.jpg');
figure;
imshow(Ia);
figure;
imshow(Ib);

im2Pts = [1319, 1271, 1;
    1427, 1547, 1;
    1331, 847, 1;
    1447, 962, 1;
    1199, 950, 1;
    1055, 1067, 1;
    1383, 1619, 1;
    814, 1615, 1;
    2139, 223, 1;
    998, 399, 1;
    1950, 1563, 1
    ];

im1Pts = [842, 1311, 1;
    944, 1596, 1;
    855, 880, 1;
    997, 1004, 1;
    713, 992, 1;
    553, 1105, 1;
    890, 1684, 1;
    270, 1690, 1;
    1703, 295, 1;
    531, 387, 1;
    1471, 1607, 1
    ];

% [p, K, R, C, imgEstimated] = ransac2(im2Pts, im1Pts, Ib, Ia);
[im1Pts, im2Pts, Ia, Ib] = sift(Ia, Ib);
[p, K, R, C, imgEstimated] = ransac2(im2Pts, im1Pts, Ib, Ia);

 estimatedImg = p*im1Pts';
imgEstimated = round(estimatedImg ./ repmat(estimatedImg(3,:),3,1))';

figure;
imshow(Ia);
hold on;
plot(im2Pts(:,1), im2Pts(:,2), 'r*', 'LineWidth',5);
plot(imgEstimated(:,1), imgEstimated(:,2), 'yo', 'LineWidth',2);  
legend('actual Points','estimated points') 

% [im1Pts, im2Pts, Ia, Ib] = sift(Ia, Ib);
% m = randperm(size(im1Pts,1), 4);
% dlt(im1Pts(m,:), im2Pts(m,:))



