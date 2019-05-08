%------------------------------------------
% LAB 2 Marta G?owacka 234999 
%------------------------------------------

%------------------------------------------
% Obraz ze Stanis?awem Poniatowskim
% Operacje na obrazie
%------------------------------------------
%Mój w?asny wektor
w = [0 1 0 0 0 1 0 0 0 0  0 0 1 1 0 1 1 0 0 0  1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0];

%Wczytanie obrazka
f = imread('Poniatowski.png');

%Tworzenie okna na obrazek
figure;
subplot(2,5,1);
imshow(f);
title('Oryginal')

%Negatyw
g = imadjust(f, [0 1], [1 0]);   % te dwie linijki
%g = imcomplement(f);            % robia to samo
subplot(2,5,2);
imshow(g);
title('Negatyw')

%Piksele low in = 0.5, high in = 0.75 zamienione na low out = 0 i high out
%= 1
g = imadjust(f, [0.5 0.75], [0 1]);   
subplot(2,5,3);
imshow(g);
title('Adjust [0.5 0.75] - > [0 1]')

%Piksele low in = 0, high in = 1 zamienione na low out = 0.4 i high out
%= 0.6
g = imadjust(f, [0 1], [0.4 0.6]);   
subplot(2,5,4);
imshow(g);
title('Adjust [0 1] - > [0.4 0.6]')

%Adjust, ale z warto?ci? gamma = 2
g = imadjust(f, [], [], 2);   
subplot(2,5,5);
imshow(g);
title('Adjust wszystkie wartosci gamma: 2')

%Adjust, ale z warto?ci? gamma = 0.2
g = imadjust(f, [], [], 0.2);   
subplot(2,5,6);
imshow(g);
title('Adjust wszystkie wartosci gamma: 0.2')

%Adjust z przedzia?em obliczonym - minimalna i maksymalna jasno?? w obrazie
g = imadjust(f, stretchlim(f), []);
subplot(2,5,7);
imshow(g);
title('Adjust ze sretchlim')

%w - moja maska, replicate - zachowanie na brzegach obrazu
g = imfilter(f, w, 'conv', 'replicate');
%g = imfilter(f, rot90(w,2), 'replicate');  % nie wiem czy jest jakas roznica po tym obrocie o 180* 
subplot(2,5,8);
imshow(g);
title('Filtr z maska w')

%Maski
w4 = fspecial('laplacian', 0);
w8 = [1 1 1; 1 -8 1; 1 1 1];

f2 = im2double(f); % tofloat() nie jest domyslna funkcja matlaba, dlatego trzeba uzyc im2double()

%Wyostrzanie
g4 = f2 - imfilter(f2, w4, 'replicate');
g8 = f2 - imfilter(f2, w8, 'replicate');  %wyostrzenie - odjecie: obraz-laplacian
subplot(2,5,9);
imshow(g4, []);
title('Laplacian 3x3 w masce w4');
subplot(2,5,10);
imshow(g8, []);
title('Laplacian 3x3 w masce w8');

%------------------------------------------
% Obraz psa
% Filtry i maski
%------------------------------------------
 figure;
 % filtry oparte na statystykach pozycyjnych
 % obraz wej, pozycja, maska m x n
 m = 3; n = 3;
 f = imread('happy_dog.jpg');
 f = rgb2gray(f);
 subplot(2,2,1);
 imshow(f);
 title('Oryginal');

 %Maska 3 x 3 samych jedynek
 g = ordfilt2(f,1,ones(3,3));
 subplot(2,2,2);
 imshow(g);
 title('Maska 3x3 minimum filter');
 
  g = ordfilt2(f,9,ones(3,3));
 subplot(2,2,3);
 imshow(g);
 title('Maska 3x3 maximum filter');
 
 g = ordfilt2(f,5,ones(3,3));
 subplot(2,2,4);
 imshow(g);
 title('Maska 3x3 median filter');

 %------------------------------------------
 % Obraz minionki
 % Ró?ne rodzaje szumu
 %------------------------------------------
 
 
%Wczytanie obrazka
 f = imread('minionki.jpg');

 %Oryginalny obrazek
 figure;
 subplot(2,2,1);
 imshow(f);
 title('Oryginal');
 
 %Szum - sól i pieprz, 0.5
 fn = imnoise(f, 'salt & pepper', 0.5);
 subplot(2,2,2);
 imshow(fn);
 title('Sól i pieprz');
 
  %Szum - speckle, 0.5
 s = imnoise(f,'speckle', 0.5);  
 subplot(2,2,3);
 imshow(s);
 title('Speckle');

  %Szum Gaussa, 0.5
 g = imnoise(f,'gaussian', 0.5);
 subplot(2,2,4);
 imshow(g);
 title('Gaussowski szum');