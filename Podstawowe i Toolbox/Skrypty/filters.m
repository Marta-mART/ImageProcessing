clear;

%--------------------------------------------------------
RGB = imread('C:\Users\Student\Desktop\Marta\gory.jpg');
info = imfinfo('C:\Users\Student\Desktop\Marta\gory.jpg');
[rows, columns, numberOfColorChannels] = size(RGB);
figure;
subplot(2,2,1);
imshow(RGB);
title('Normal image');

%--------------------------------------------------------
%Zbadanie ?redniego kontrastu oryginalnego obrazu
%--------------------------------------------------------
image_contrast = max(RGB(:)) - min(RGB(:)); 
average_contrast = image_contrast/2;
display(average_contrast);
%--------------------------------------------------------
%Przekszta?cenie liniowe - rozja?nienie
%--------------------------------------------------------
const_bright = 40;
RGB_bright(:, 1:columns) = RGB(:,1:columns) + const_bright;

subplot(2,2,2);
imshow(RGB_bright);
title('Brightened image');

%--------------------------------------------------------
%Zbadanie ?redniego kontrastu rozja?nionego obrazu
%--------------------------------------------------------
image_contrast_after = max(RGB_bright(:)) - min(RGB_bright(:)); 
average_contrast_after = image_contrast_after/2;
display(average_contrast);

%--------------------------------------------------------
%Przekszta?cenie liniowe - przyciemnianie
%--------------------------------------------------------
const_bright = 70;
RGB_bright(:, 1:columns) = RGB(:,1:columns) - const_bright;

subplot(2,2,3);
imshow(RGB_bright);
title('Darkened image');

%--------------------------------------------------------
%Przekszta?cenie liniowe - dzielenie
%--------------------------------------------------------
const_bright = 3;
RGB_bright(:, 1:columns) = RGB(:,1:columns) / const_bright;

subplot(2,2,4);
imshow(RGB_bright);
title('Divided image');
