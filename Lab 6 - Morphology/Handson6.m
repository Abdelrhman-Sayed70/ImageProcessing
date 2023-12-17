I = imread('spheres.png');
figure, imshow(I), title('original image');

gr = rgb2gray(I);
figure, imshow(gr), title('gray image');

% get image in base form [black background]
gr = ~gr;
figure, imshow(gr), title('gray image [base form]');

% do erosion on image in base form [black background]
se = strel('sphere', 25);
eroddedI = imerode(gr, se);
figure, imshow(eroddedI), title('erodded image');


% do segementatoin on image [objects must filled wiht white]
[L, num] = bwlabel(eroddedI);
figure, imshow(L), title('segmented objects');
rgbL = label2rgb(L);
figure, imshow(rgbL), title('segmented objects (rgb)');
num