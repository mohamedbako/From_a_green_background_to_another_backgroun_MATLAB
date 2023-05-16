clear all;

% We can use the imresize function or manual adjustment to adjust the image size
% because we are using an image in this project I set it manually


% I called manWithGS my image, and saved it as A1
A1 = imread ('manWithGS.jpg');

% Here I converted A1 image RGB to HSV and saved as A2
A2 = rgb2hsv(A1);

% Output A2
imwrite(A2,'RGBtoHSV.jpg');

% We gave the size of the picture
row = size(A2)(1);
col = size(A2)(2);

% Here for(HSV) I just called H => (:,:,1) and S => (:,:,2)
% because when I call V the picture gets very distorted
A = uint8(255*A2(:,:,1));
A = uint8(255*A2(:,:,2));

% Output A
imwrite(A,'HS_Photo.jpg');

% we say in this loop [col*row] look at pixels one by one
% if (A) pixel value is above the threshold
% Let A3 matrix be 0
% get another 1

threshold = 140;
A3 = 0;
for i = 1 : row
  for j = 1 : col
    if A(i,j) > threshold 
      A3(i,j) = 0;
    else 
      A3(i,j) = 1;
    end
  end
end

% Output the A3
imwrite(A3,'WhiteBlack.jpg');

% I multiplied the RGB value A3(mask) and scored A1
% R => (:,:,1), G => (:,:,2), B => (:,:,3)
A1(:,:,1) = A3.*A1(:,:,1);
A1(:,:,2) = A3.*A1(:,:,2);
A1(:,:,3) = A3.*A1(:,:,3);

% Output A1
imwrite(A1,'WithOutGreen.jpg');

% I called my image myBackground, and saved it as background
background = imread('myBackground.jpeg');

% we say in this loop [col*row] look at pixels one by one
% if (A1) pixel value is above the threshold
% A1 pixels and background pixels sync

threshold = 2;
for i = 1 : row
  for j = 1 : col
      if A1(i,j) < threshold;
      A1(i,j,:) = background(i,j,:);
     end
  end
end

% Output A1
imwrite(A1,'newPhoto.jpg');