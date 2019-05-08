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
RGB_trippled(:, :) = RGB(:,1:3*columns);

subplot(2,2,2);
imshow(RGB_trippled);
title('Trippled image');

%--------------------------------------------------------
x = 1:size(RGB,1);
y = 1:size(RGB,2);

for i = 1:size(RGB,1)
    bright = mean2(RGB(33:33,i:i));
    tab(1,i) = bright;
end
subplot(2,2,3);
plot(tab);

% Add labels and title
xlabel('Linia')
ylabel('Jasnosc')
title('Jasnosc w linii')

%--------------------------------------------------------
subplot(2,2,4);
[J, rect] = imcrop(RGB);
title('Kadrowanie i zapis do pliku');

%Zapis
imwrite(J, 'cropped_img.jpg');