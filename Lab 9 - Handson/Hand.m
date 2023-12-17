I = imread('4.jpg');
figure, imshow(I), title('original image');

gr = rgb2gray(I);
figure, imshow(gr), title('gray image');

thrI = im2bw(gr, 0.9);
figure, imshow(thrI), title('thresholed image');

thrI = ~thrI;
figure, imshow(thrI), title('base form image');

% crop image 
[h, w, d] = size(I);
H = h / 4;
croppedI = imcrop(thrI, [0 0 w H]);
figure, imshow(croppedI), title('cropped image');

% dialation
se = strel('square', 10);
croppedI = imdilate(croppedI, se);
figure, imshow(croppedI), title('dialted image');

% segmentation
[L, num] = bwlabel(croppedI);
fprintf('number of fingers: %d\n', num);