    I = imread('distort.jpg');
    I = imresize(I, 0.5);
    [M N]=size(I);
    k = 0.01;
    center = [round(N/2) round(M/2)];

    % Creates N x M (#pixels) x-y points
    [xi,yi] = meshgrid(1:N,1:M);
    
        % Creates converst the mesh into a colum vector of coordiantes relative to
    % the center
    xt = xi(:) - center(1);
    yt = yi(:) - center(2);
    % Converts the x-y coordinates to polar coordinates
    [theta,r] = cart2pol(xt,yt);
    % Calculate the maximum vector (image center to image corner) to be used
    % for normalization
    R = sqrt(center(1)^2 + center(2)^2);
    % Normalize the polar coordinate r to range between 0 and 1 
    r = r/R;

    
    a = 0.0;%-0.007715;
b = 0.026731;
c = 0.0;
d = 1.0 - a - b - c; % 1 for no scale of image

    %s = r.*(1./(a .* r.^3 + b .* r.^2 + c .*r));
    %s = r.*(1./(1+k.*(r.^2)));
    
    % un-normalize s
    s2 = s * R;
    
     % Convert back to cartesian coordinates
    [ut,vt] = pol2cart(theta,s2);
    
    u = reshape(ut,size(xi)) + center(1);
    v = reshape(vt,size(yi)) + center(2);
    tmap_B = cat(3,u,v);
    resamp = makeresampler('cubic', 'fill');
    I3 = tformarray(I,[],resamp,[2 1],[1 2],[],tmap_B,255);
    figure;
    imshow(I);
    figure;
    imshow(I3,[]);