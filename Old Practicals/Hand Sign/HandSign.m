I = imread("4.jpg");
figure, imshow(I), title('original image');

% convert to gray scale image
gr = rgb2gray(I);
figure, imshow(gr), title('gray image');

% thresholding 
threshI = im2bw(gr, 0.9);
figure, imshow(threshI), title('thresholded image');

% return image to base form [black background]
I = ~threshI;
figure, imshow(I), title('image in base form [black background]');

% crop image 
[h, w, d] = size(I);
H = h / 4;
croppedI = imcrop(I, [0 0 w H]);
figure, imshow(croppedI), title('cropped image');

% dialation to remove noise
se = strel('square', 15);
I = imdilate(croppedI, se);
figure, imshow(I), title('dialated image');

% objects segmentation
[L, num] = bwlabel(I);
rgpL = label2rgb(L);
figure, imshow(rgpL), title('segmented objects [rgp]');
fprintf("Fingers count = %d\n", num);