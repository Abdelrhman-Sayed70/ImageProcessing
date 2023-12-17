I = imread('Filters.png');
figure, imshow(I);

I = rgb2gray(I);
figure, imshow(I);

% Do smoothing
smoothedImg = medfilt2(I,[30 30]);
figure, imshow(smoothedImg);

% Do thresholding
refThresh = graythresh(smoothedImg);
fprintf('reference threshold: %d\n', refThresh);
bw = im2bw(smoothedImg, refThresh);
figure, imshow(bw)

% Edge detection
edges = edge(bw, "sobel");
figure, imshow(edges);