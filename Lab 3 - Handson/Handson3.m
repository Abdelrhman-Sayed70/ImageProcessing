% Q1
img1 = imread('Jaguar.bmp');
subplot(3,2,1), imshow(img1), title('Jaguar Image');

subplot(3,2,2), imhist(img1(:, :, 1)), title("Jaguar Red Histogram");
subplot(3,2,3), imhist(img1(:, :, 2)), title("Jaguar Green Histogram");
subplot(3,2,4), imhist(img1(:, :, 3)), title("Jaguar Blue Histogram")

% Q2  --> contrast stretching
img2 = imread("ContrastDark.bmp");
figure, imshow(img2), title('Img2 [before contrast]');
figure, imhist(img2), title("img2 histogram [before contrast]");

contrastedImg2 = Contrast(img2, 0, 255);
figure, imshow(contrastedImg2), title('Img2 [after contrast]');
figure, imhist(contrastedImg2), title("img2 histogram [after contrast]")

% Q3 --> histogram equalization
img3 = imread('Unequalized_1.jpg');
figure, imshow(img3), title('Img3 [before eq]');
figure, imhist(img3), title("img3 histogram [before eq]");

img3Equalized = histeq(img3);
figure, imshow(img3Equalized), title('Img3 [after eq]');
figure, imhist(img3Equalized), title("img3 histogram [after eq]");

% Q4 --> histogram matching 
img4 = imread('concordaerial.png');
img5 = imread('concordorthophoto.png');
img6 = imhistmatch(img4, img5);
figure, imshow(img4), title('Img4');
figure, imshow(img5), title('Img5');
figure, imshow(img6), title('Img6');
figure, imhist(img6), title("matched image histogram");
