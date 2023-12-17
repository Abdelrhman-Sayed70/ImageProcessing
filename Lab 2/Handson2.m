addpath('functions')
addpath('Images')

% read and show images
img1 = imread('I1.jpg');
img2 = imread('I2.jpg');

figure, imshow(img1), title('img1');
figure, imshow(img2), title('img2');

% extracting the size of 2 images
[H1, W1, L1] = size(img1);
[H2, W2, L2] = size(img2);

% get differences
diff = imabsdiff(img1, img2);
figure, imshow(diff), title('diff')

% multiply the differences by 255 to make differences white
diffWhite = diff * 255;
figure, imshow(diffWhite);

% finalImg contains extra items with white box
finalImg = img1 + diffWhite;
figure, imshow(finalImg);

