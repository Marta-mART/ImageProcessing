clear;

%--------------------------------------------------------
RGB = imread('gory.jpg');
info = imfinfo('gory.jpg');
[rows, columns, numberOfColorChannels] = size(RGB);
figure;
subplot(2,2,1);
imshow(RGB);
title('Normal image');

%--------------------------------------------------------
%Toolbox - add
%--------------------------------------------------------
RGB_added = imadd(RGB,40);
subplot(2,2,1);
imshow(RGB_added);
title('Added image using imaad()');

%--------------------------------------------------------
%Toolbox - erode
%--------------------------------------------------------
se = strel('ball',12,10);
erodedBW = imerode(RGB,se);
subplot(2,2,2);
imshow(erodedBW);
title('Eroded image');

%--------------------------------------------------------
%Toolbox - blurred and restrored
%--------------------------------------------------------
RGB = im2double(imread('gory.jpg'));
subplot(2,2,3);
LEN = 66;
THETA = 34;
PSF = fspecial('motion', LEN, THETA);
blurred = imfilter(RGB, PSF, 'conv', 'circular');
imshow(blurred);
title('Blurred Image');

subplot(2,2,4);
wnr1 = deconvwnr(blurred, PSF, 0);
imshow(wnr1);
title('Restored Image');
