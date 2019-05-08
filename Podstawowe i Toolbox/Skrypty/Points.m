clear;

%--------------------------------------------------------
%Punktowe przekszta?cenie
%--------------------------------------------------------
RGB = imread('slon.jpg');
info = imfinfo('slon.jpg');
[rows, columns, numberOfColorChannels] = size(RGB);
figure;
subplot(2,2,1);
imshow(RGB);
title('Normal image');

x = 1:rows;
y = 1:columns;

for i = 1:rows
    for j = 1:columns
        if(RGB(i:i,j:j) > 160)
            RGB2(i:i,j:j) =  RGB(i:i,j:j) + 233;
        end;
    end;
end
subplot(2,2,2);
imshow(RGB2);
title('Rozjasnione px > 160')

for i = 1:rows
    for j = 1:columns
        if(RGB(i:i,j:j) > 50)
            RGB2(i:i,j:j) =  RGB(i:i,j:j) + 233;
        end;
    end;
end
subplot(2,2,3);

imshow(RGB2);
title('Rozjasnione px > 50')


for i = 1:rows
    for j = 1:columns
        if(RGB(i:i,j:j) > 200)
            RGB2(i:i,j:j) =  RGB(i:i,j:j) - 233;
        end;
    end;
end
subplot(2,2,4);

imshow(RGB2);
title('Przyciemnione px > 50')
