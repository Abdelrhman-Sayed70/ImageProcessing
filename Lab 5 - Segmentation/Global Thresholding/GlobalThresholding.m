% Do image segmentation [thresholding-based]

addpath('Functions');

I = imread('b2.jpg');
I = rgb2gray(I);

figure, imshow(I), title('Original Image');
figure, imhist(I), title('Original Image Histogram');

threshold = graythresh(I);
fprintf("threshold: %d\n", threshold);
SegmentedImg = im2bw(I, threshold);
figure, imshow(SegmentedImg), title('Segmented Image');