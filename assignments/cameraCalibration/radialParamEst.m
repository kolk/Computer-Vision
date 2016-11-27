imgPts = [14, 27, 1;
91, 34, 1;
166, 37, 1;
245, 44, 1;
325, 47, 1;
407, 52, 1;
493, 57, 1;
20, 104, 1;
94, 110, 1;
168, 117, 1;
245, 122, 1;
323, 128, 1;
404, 134, 1;
488, 140, 1;
398, 209, 1;
474, 246, 1;
465, 279, 1;
455, 316, 1;
444, 360, 1;
387, 236, 1;
304, 231, 1;
224, 223, 1;
114, 216, 1;
66, 210, 1;
34, 240, 1;
117, 246, 1;
200, 254, 1];  

I = imread('IMG_5464.JPG');
gray = rgb2gray(I);
rows = size(I,1);
cols = size(I,2);
d = min(rows, cols) / 2;
centerX = cols/2;
centerY = rows/2;
UnXList = [];
UnYList = [];
        
mnErr = 5000000;
estK1 = 0;
estK2 = 0;
for k1 = -0.1:0.0001:0.1
    for k2 = -0.1:0.0001:0.1
        for i = 1:size(imgPts,1)
            xd = imgPts(i,1);
            yd = imgPts(i,2);
            %xd = (x - centerX);
            %yd = (y - centerY);
            r = sqrt((xd-centerX)^2 + (yd-centerY)^2);
            Lr = 1 + k1*r^2 + k2*r^4;
            xUn = xd/Lr;
            yUn = yd/Lr;
            UnXList = [UnXList;xUn];
            UnYList = [UnYList;yUn];
        end
        err = 0;
        for p = 1:size(UnXList,1)
            for q = p+1:size(UnXList,1)
                err = err + sqrt((UnXList(p) - UnXList(q))^2 + (UnYList(p) - UnYList(q))^2);
            end
        end
        if err < mnErr
            mnErr = err;
            estK1 = k1;
            estK2 = k2;
        end
    end
end
estK1
estK2